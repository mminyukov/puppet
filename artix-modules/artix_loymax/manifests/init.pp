class artix_loymax (
    $loymax_enable               = false,
    $loymax_serverUrl            = "http://localhost",
    $loymax_timeout              = "30",
    $loymax_user                 = "",
    $loymax_password             = "",
    $loymax_deviceLogicalId      = "",
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { 'loymax.ini' :
        ensure  => $artix_loymax::loymax_enable ? { true => file, default => absent },
        name    => '/linuxcash/cash/conf/ncash.ini.d/loymax.ini',
        content => template('artix_loymax/loymax_ini.erb')
    }
}
