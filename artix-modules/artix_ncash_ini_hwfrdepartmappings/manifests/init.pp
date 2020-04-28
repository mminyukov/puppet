class artix_ncash_ini_hwfrdepartmappings (
    $enableMultiFr             = false,
    $hwfrdepartmappings        = [],
    $hwfr_One_Departmappings   = [],
    $hwfr_Two_Departmappings   = [],
    $hwfr_Three_Departmappings = [],
    $hwfr_Four_Departmappings  = [],
    $hwfr_Five_Departmappings  = [],
    $hwfr_Six_Departmappings   = [],
    $hwfr_Seven_Departmappings = []
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_hwfrdepartmappings.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_hwfrdepartmappings.ini",
        content => template("artix_ncash_ini_hwfrdepartmappings/ncash_hwfrdepartmappings.erb"),
    }
}
