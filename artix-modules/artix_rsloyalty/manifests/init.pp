class artix_rsloyalty (
    $rsloyalty_discAndBonusEnable    = false,
    $rsloyalty_certificateEnable     = false,

    $rsloyalty_hosts                 = "http://127.0.0.1/",
    $rsloyalty_timeout               = "5",
    $rsloyalty_user                  = "",
    $rsloyalty_password              = "",
    $rsloyalty_checkCouponPrefix     = "rsloyalty",
    $rsloyalty_positionCouponPrefix  = "rsloyalty",
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { 'rsloyalty.ini' :
        ensure  => ($artix_rsloyalty::rsloyalty_discAndBonusEnable or $artix_rsloyalty::rsloyalty_certificateEnable) ? { true => file, default => absent },
        name    => '/linuxcash/cash/conf/ncash.ini.d/rsloyalty.ini',
        content => template('artix_rsloyalty/rsloyalty_ini.erb')
    }
}
