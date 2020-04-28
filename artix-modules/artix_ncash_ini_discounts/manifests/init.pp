class artix_ncash_ini_discounts (
    $distributeReceiptDiscountFully = true,
    $discMode                       = "over",
    $discPositionMode               = "deny",
    $pos2CheckDiscRel               = "deny",
    $unitePositionsInKit            = true,
    $allowPartialPointsSpend        = true,
    $saveNullDiscountForPosition    = false,
    $ignoreMinimalPriceForKit       = true
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_discounts.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_discounts.ini",
        content => template("artix_ncash_ini_discounts/ncash_discounts.erb"),
    }
}
