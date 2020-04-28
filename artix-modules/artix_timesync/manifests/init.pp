class artix_timesync (
    $ntp_enable  = false,
    $ntp_servers = [],
)
{

    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { "ntpserver.conf" :
        ensure  => $artix_timesync::ntp_enable ? { true => present, default => absent, } ,
        name    => "/linuxcash/cash/conf/ntpserver.conf",
        content => template("artix_timesync/ntpsync.erb"),
    }
}
