#
# = Класс: puppet
#
# Предназначен для конфигурирования puppet клиента.
#
#
# == Параметры
#
# [*server*]
#   Имя puppet сервера (puppet master), к которому должен подключаться агент.
#
# [*masterport*]
#   Номер порта, на котором слушает puppet сервер.
#
#   Значение по молчанию: 8140
#
# [*runinterval*]
#   Как часто puppet агент применяет конфигурацию для клиента; в секундах.
#
#   Значение по молчанию: 7200
#
# [*splay*]
#   Использовать ли задержку перед первым запуском агента.
#
#   Значение по молчанию: true
#
# [*splaylimit*]
#   Максимальное время задержки перед запуском агента; в секундах. Время задержки
#   генерируется псевдо случайным образом в пределах указанного интервала.
#
#   Значение по молчанию: 7200
#
# [*run_as_service*]
#   Использовать агента или планировщик для применения конфигурации  Значение 'true'
#   предполагает использование агента, 'false' - периодические обращения к серверу
#   инициируемые планировщиком.
#
#   Значение по молчанию: false
#
# [*fixed_time*]
#   Фиксированное время запуска планировщика. Если 'true' Запуск в 8:15 и в 9:45,
#   если 'false' - периодические обращения к серверу, через каждые 2 часа.
#
#   Значение по молчанию: false
#
# [*old_version*]
#   Старый клиент puppet. Если клиент версии 0.25 надо установить в true
#
#   Значение по молчанию: false
#
#
# == Примеры
#
# :include:../README.rdoc
#
#
# == Автор
#   Yurii Anisimov <ays@rssib.ru>
#
#
class artix_upgrade::puppet (
    $server_name,
    $server_ip       = '',
    $oldcertname     = $hostname,
    $bind_name       = false,
    $masterport      = 8140,
    $runinterval     = 7200,
    $splay           = true,
    $splaylimit      = 7200,
    $old_version     = false,
    $hostnamegen     = false,
    $hostname        = 'cash-%(shopcode)s-%(cashcode)s.local.domain.ru',
    $certname        = 'cash-%(shopcode)s-%(cashcode)s',
    $proxy_enable    = false,
    $http_proxy_host = '',
    $http_proxy_port = 3128,
    $agent_catalog_run_lockfile = '/var/run/puppetdlock'

)
{
    if $::memorysize_mb > 250 {
        $run_as_service = true
    }
    else {
        $run_as_service = false
    }

    File {
        owner => root,
        group => root,
        mode  => 0644,
    }


    file { "hostnamegen.conf" :
        name    => "/linuxcash/cash/conf/hostnamegen.conf",
        content => template("artix_upgrade/hostnamegen.erb"),
    }
    exec { "generate_hostname" :
        path        => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
        command     => "/usr/bin/python /linuxcash/cash/tools/tools_avail/generate_hostname.py",
        require     => File["hostnamegen.conf"],
        subscribe   => File["hostnamegen.conf"],
        refreshonly => true,
        onlyif      => "test -f /linuxcash/cash/tools/tools_avail/generate_hostname.py",
    }

    if $bind_name == true {
        host { $server_name :
            ip => $server_ip,
        }
    }

    if $::old_version == true {
        $section_name = 'puppetd'
    } else {
        $section_name = 'agent'
    }

#    package { 'artix-puppet' :
#        ensure      => installed,
#        configfiles => keep,
#        provider    => aptitude,
#    }


    if versioncmp($puppetversion, '3.0') > 0 {
        if $proxy_enable {
            augeas { "puppet.conf":
                context => "/files/etc/puppet/puppet.conf",
                changes => [
                "rm  main/templatedir",
                "set ${section_name}/runinterval ${runinterval}",
                "set ${section_name}/splay ${splay}",
                "set ${section_name}/splaylimit ${splaylimit}",
                "set ${section_name}/server ${server_name}",
                "set ${section_name}/masterport ${masterport}",
                "set main/http_proxy_host ${http_proxy_host}",
                "set main/http_proxy_port ${http_proxy_port}",
                ],
                require => Package['augeas-lenses'],
                notify  => Service['puppet_service'],
            }
        }
        else {
            augeas { "puppet.conf":
                context => "/files/etc/puppet/puppet.conf",
                changes => [
                    "rm  main/templatedir",
                    "set ${section_name}/runinterval ${runinterval}",
                    "set ${section_name}/splay ${splay}",
                    "set ${section_name}/splaylimit ${splaylimit}",
                    "set ${section_name}/server ${server_name}",
                    "set ${section_name}/masterport ${masterport}",
                    "set ${section_name}/agent_catalog_run_lockfile ${agent_catalog_run_lockfile}",
                    ],
                require => Package['augeas-lenses'],
                notify  => Service['puppet_service'],
            }
        }
        service { "puppet_service" :
            ensure    => $puppet::run_as_service ? { true => "running", default => "stopped", } ,
            name      => "puppet",
            hasstatus => "true",
            enable    => $puppet::run_as_service,
            require   => [ Augeas["puppet.conf"], File["puppet_default"] ],
        }
    }
    else {
        file { "puppet.conf" :
            name    => "/etc/puppet/puppet.conf",
            content => template("artix_upgrade/puppet.erb"),
            notify  => Service["puppet_service"],
        }
        service { "puppet_service" :
            ensure    => $puppet::run_as_service ? { true => "running", default => "stopped", } ,
            name      => "puppet",
            hasstatus => "true",
            enable    => $puppet::run_as_service,
            require   => [ File["puppet.conf"], File["puppet_default"] ],
        }
    }
    file { "puppet_default" :
        name    => "/etc/default/puppet",
        content => template("artix_upgrade/default.erb"),
        notify  => Service["puppet_service"],
        require => Package["puppet"]
    }


    file { "puppet-start.sh" :
        name    => "/linuxcash/cash/bin/puppet-start.sh",
        source  => "puppet:///modules/artix_upgrade/puppet-start.sh",
        mode    => "0755",
        require => Package["puppet"]
    }



    file { '/linuxcash/cash/bin/puppet-start-after-boot.sh' :
        ensure  => $puppet::run_as_service ? { true => absent, default => present, } ,
        source  => "puppet:///modules/artix_upgrade/puppet-start-after-boot.sh",
        mode    => '0755',
        require => Package["puppet"]
    }

    file { '/etc/cron.daily/puppet-start' :
        ensure  => $puppet::run_as_service ? { true => absent, default => present, } ,
        source  => "puppet:///modules/artix_upgrade/puppet-start",
        mode    => '0755',
        require => Package["puppet"]
    }
    if $operatingsystemrelease == '10.04' {
        package { [ 'libaugeas-ruby1.8', 'puppet', 'augeas-lenses' , 'anacron', 'facter' ] :
            ensure      => latest,
            configfiles => keep,
            provider    => aptitude,
        }
    }
    else {
        package { [ 'puppet', 'augeas-lenses' , 'anacron', 'facter' ] :
            ensure      => latest,
            configfiles => keep,
            provider    => aptitude,
        }
    }
}
