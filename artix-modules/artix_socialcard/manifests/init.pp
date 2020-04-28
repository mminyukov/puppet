class artix_socialcard (
    $sc_enable         = "off",
    $sc_valutCode      = "6",
    $sc_deptCode       = "2",
    $sc_indexPrice     = "5",
    $sc_allowBonusEarn = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "socialcard.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/socialcard.ini",
        content => template("artix_socialcard/socialcard.erb"),
    }
}
