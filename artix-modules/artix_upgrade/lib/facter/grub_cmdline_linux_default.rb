# grub_cmdline_linux_default.rb

grub_cmdline_linux_default = nil
grub_cmdline_linux = {}

grub_cmdline_linux_default = %x[ /bin/grep ^GRUB_CMDLINE_LINUX_DEFAULT /etc/default/grub | /usr/bin/awk -F '"' {'print $2'} |  sed 's/^[ \t]*//;s/[ \t]*$//'| tr -d '\n' ]
grub_cmdline_linux['grub_cmdline_linux_default'] = grub_cmdline_linux_default

grub_cmdline_linux.each{ |name, fact|
    Facter.add(name) do
        setcode do
            fact
        end
    end
}

