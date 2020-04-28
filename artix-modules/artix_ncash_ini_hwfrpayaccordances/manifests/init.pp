class artix_ncash_ini_hwfrpayaccordances (
    $enableMultiFr             = false,
    $hwfrpayaccordances        = [],
    $hwfr_One_payaccordances   = [],
    $hwfr_Two_payaccordances   = [],
    $hwfr_Three_payaccordances = [],
    $hwfr_Four_payaccordances  = [],
    $hwfr_Five_payaccordances  = [],
    $hwfr_Six_payaccordances   = [],
    $hwfr_Seven_payaccordances = []
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_hwfrpayaccordances.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_hwfrpayaccordances.ini",
        content => template("artix_ncash_ini_hwfrpayaccordances/ncash_hwfrpayaccordances.erb"),
    }
}
