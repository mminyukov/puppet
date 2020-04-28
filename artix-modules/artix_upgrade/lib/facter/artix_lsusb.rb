# artix_lsusb.rb

usbid = nil
usbname = nil
test = {}
usbid_list = %x[/usr/bin/lsusb | /usr/bin/awk '{print $6}' ]
usbid_list.split("\n").each do |usb_item|
    usbname = %x[/usr/bin/lsusb -v -d #{usb_item} | /bin/grep -E 'iManufacturer|iProduct' | /usr/bin/awk '{$1=$2=""; print $0}' | /bin/grep -v -E 'USB.*Hub|Linux.*generic|.*Host\ Controller' | tr -d '\n' | sed 's/^[ \t]*//']
    if usb_item != nil && usbname != ''
        test["usb_" + usb_item] = usbname
        usbname = nil
        usbid = nil
    end
end

test.each{ |name, fact|
    Facter.add(name) do
        setcode do
            fact
        end
    end
}
