class artix_ncash_ini_hwfrcommonsparams (
    $hwfrcommonsparams = []
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_hwfrcommonsparams.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_hwfrcommonsparams.ini",
        content => template("artix_ncash_ini_hwfrcommonsparams/ncash_hwfrcommonsparams.erb"),
    }
}
