class artix_ncash_ini_hwfrcommonscliches (
    $hwfrcommonscliches = []
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_hwfrcommonscliches.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_hwfrcommonscliches.ini",
        content => template("artix_ncash_ini_hwfrcommonscliches/ncash_hwfrcommonscliches.erb"),
    }
}
