class openvpn (
  $enable    = true,
  $vpn_host  = '127.0.0.1',
  $vpn_port  = '1194',
  $cert_name = $::hostname
)
{
    File {
        owner => 'root',
        group => 'root',
        mode  => '0440',
    }
    package { 'package-openvpn' :
        ensure      => $openvpn::enable ? { true => installed, default => purged, } ,
        name        => 'openvpn',
        configfiles => 'keep',
        provider    => 'aptitude',
    }
    if $openvpn::enable {
        file { "dh1024.pem" :
            name    => "/etc/openvpn/dh1024.pem",
            source  => "puppet:///files/openvpn/dh1024.pem",
            notify  => Service['openvpn'],
            require => Package["package-openvpn"],
        }
        file { "ca.crt" :
            name    => "/etc/openvpn/ca.crt",
            source  => "puppet:///files/openvpn/ca.crt",
            notify  => Service['openvpn'],
            require => Package["package-openvpn"],
        }
        file { "cert_name.key" :
            name    => "/etc/openvpn/${cert_name}.key",
            source  => "puppet:///files/openvpn/${cert_name}.key",
            notify  => Service['openvpn'],
            require => Package["package-openvpn"],
        }
        file { "cert_name.crt" :
            name    => "/etc/openvpn/${cert_name}.crt",
            source  => "puppet:///files/openvpn/${cert_name}.crt",
            notify  => Service['openvpn'],
            require => Package["package-openvpn"],
        }
        file { "cert_name.conf" :
            name    => "/etc/openvpn/${cert_name}.conf",
            content => template("openvpn/configopenvpn.erb"),
            notify  => Service['openvpn'],
            require => Package["package-openvpn"],
        }
        service { 'openvpn' :
            ensure    => $openvpn::enable ? { true => running, default => stopped, } ,
            name      => openvpn,
            enable    => $openvpn::enable,
            hasstatus => $openvpn::enable,
            require   => Package['package-openvpn'],
        }
    }
    else {
        file { '/etc/openvpn' :
            ensure  => absent,
            force   => true,
            recurse => true,
        }
    }
}
