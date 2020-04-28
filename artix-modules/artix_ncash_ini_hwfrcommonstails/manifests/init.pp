class artix_ncash_ini_hwfrcommonstails (
    $hwfrcommonstails = []
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_hwfrcommonstails.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_hwfrcommonstails.ini",
        content => template("artix_ncash_ini_hwfrcommonstails/ncash_hwfrcommonstails.erb"),
    }
}
