class artix_autofs (
    $enable          = true,
    $cifs_enable     = true,
    $cifs_mountpoint = "/linuxcash/net",
    $cifs_timeout    = 0,
    $cifs_key        = "server",
    $cifs_parameters = "-fstype=cifs,rw,noperm,nocase,noacl,dir_mode=0777,file_mode=0666,credentials=/etc/auto.auth",
    $cifs_login      = "",
    $cifs_password   = "",
    $cifs_host       = $::artix_fileserver,
    $cifs_share      = "",
    $ftp_enable      = false,
    $ftp_mountpoint  = "/linuxcash/net/server",
    $ftp_timeout     = 600,
    $ftp_key         = "ftp",
    $ftp_machine     = "",
    $ftp_login       = "",
    $ftp_password    = ""
)
{
    File {
        owner => 'root',
        group => 'root',
        mode  => '0440',
    }

    file { '/linuxcash/cash/conf/auto.share' :
        ensure => absent,
    }

    package { 'autofs' :
        ensure      => $artix_autofs::enable ? { true => installed, default => purged, } ,
        name        => 'autofs',
        configfiles => 'keep',
        provider    => 'aptitude',
    }

    if $artix_autofs::enable {
        service { 'autofs' :
            ensure    => $artix_autofs::enable ? { true => running, default => stopped, } ,
            name      => autofs,
            hasstatus => true,
            enable    => $artix_autofs::enable,
            require   => Package['autofs'],
        }

        file { 'auto.master' :
            name    => '/etc/auto.master',
            content => template("artix_autofs/auto.master.erb"),
            require => Package['autofs'],
            notify  => Service['autofs'],
        }

        file { 'auto.cifs' :
            ensure  => $artix_autofs::cifs_enable ? { true => present, default => absent, },
            name    => '/etc/auto.cifs',
            content => template("artix_autofs/auto.cifs.erb"),
            require => Package['autofs'],
            notify  => Service['autofs'],
        }

        file { 'auto.auth' :
            name    => '/etc/auto.auth',
            content => template("artix_autofs/auto.auth.erb"),
            require => Package['autofs'],
            notify  => Service['autofs'],
        }

        file { 'auto.ftp' :
            ensure  => $artix_autofs::ftp_enable ? { true => present, default => absent, },
            name    => '/etc/auto.ftp',
            content => template("artix_autofs/auto.ftp.erb"),
            require => Package['autofs'],
            notify  => Service['autofs'],
        }

        file { 'netrc' :
            ensure  => $artix_autofs::ftp_enable ? { true => present, default => absent, },
            name    => '/root/.netrc',
            content => template("artix_autofs/netrc.erb"),
            require => Package['autofs'],
            notify  => Service['autofs'],
        }

        package { 'artix-ftp-client' :
            ensure      => $artix_autofs::ftp_enable ? { true => installed, default => purged, },
            name        => 'artix-ftp-client',
            configfiles => 'keep',
            provider    => 'aptitude',
        }

    }
    else {
        file { '/etc/auto.master' :
            ensure => absent,
        }
        file { '/etc/auto.cifs' :
            ensure => absent,
        }
        file { '/etc/auto.ftp' :
            ensure => absent,
        }
    }


}
