# encoding: utf-8
# artix_artix_ipaddress.rb

artix_artix_ipaddress = nil
artix_artix_ipaddressname = {}

artix_artix_ipaddress = %x[ ifconfig | grep -A1 -e 'eth' -e 'em' -e 'p[0-9]*p' | grep 'addr:' | awk {'print $2'} | cut -f2 -d':' | head -1 | tr -d '\n' ]
artix_artix_ipaddressname['artix_ipaddress'] = artix_artix_ipaddress

artix_artix_ipaddressname.each{ |name, fact|
    Facter.add(name) do
        setcode do
            fact
        end
    end
}

