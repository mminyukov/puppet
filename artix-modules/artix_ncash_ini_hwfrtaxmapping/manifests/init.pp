class artix_ncash_ini_hwfrtaxmapping (
    $hwfrtaxmapping                = [],
    $addPositionWithTaxMappingOnly = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_hwfrtaxmapping.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_hwfrtaxmapping.ini",
        content => template("artix_ncash_ini_hwfrtaxmapping/ncash_hwfrtaxmapping.erb"),
    }
}
