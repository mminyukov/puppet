# encoding: utf-8
# artix_artix_ipbonus.rb

artix_artix_ipbonus = nil
artix_artix_ipbonusname = {}

artix_artix_ipbonus = %x[ test -f /linuxcash/cash/conf/plugins/artix_bonus.xml && cat /linuxcash/cash/conf/plugins/artix_bonus.xml | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" ]
artix_artix_ipbonusname['artix_ipbonus'] = artix_artix_ipbonus

artix_artix_ipbonusname.each{ |name, fact|
    Facter.add(name) do
        setcode do
            fact
        end
    end
}
