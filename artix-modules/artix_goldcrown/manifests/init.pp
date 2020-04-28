class artix_goldcrown (
    $goldcrown_bonusEnable           = false,
    $goldcrown_certificateEnable     = false,

    $goldcrown_serverUrl             = "https://127.0.0.1/",
    $goldcrown_timeout               = "30",
    $goldcrown_certificatePassword   = undef,
    $goldcrown_certificatePath       = "/linuxcash/cash/conf/certificate/certificate.pfx",
    $goldcrown_location              = undef,
    $goldcrown_terminal              = undef,
    $goldcrown_partnerId             = undef,
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { 'goldcrown.ini' :
        ensure  => ($artix_goldcrown::goldcrown_bonusEnable or $artix_goldcrown::goldcrown_certificateEnable) ? { true => file, default => absent },
        name    => '/linuxcash/cash/conf/ncash.ini.d/goldcrown.ini',
        content => template('artix_goldcrown/goldcrown_ini.erb')
    }
}
