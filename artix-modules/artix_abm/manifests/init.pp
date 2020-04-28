class artix_abm (
    $abm_enable             = false,
    $abm_serverUrl          = "http://127.0.0.1/",
    $abm_timeout            = "10",
    $abm_user               = "",
    $abm_password           = "",
    $abm_smsVerification    = false,
    $abm_currencyName       = "BON",
    $abm_bonusRatio         = "1:1",
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { 'abmloyalty.ini' :
        ensure  => $artix_abm::abm_enable ? { true => file, default => absent },
        name    => '/linuxcash/cash/conf/ncash.ini.d/abmloyalty.ini',
        content => template('artix_abm/abmloyalty_ini.erb')
    }

}
