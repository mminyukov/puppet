class artix_ncash_ini_softcheck (
    $softcheck_engine  = "file",
    $softcheck_path    = "http://127.0.0.1:8080/CSrest/rest/",
    $softcheck_timeout = "10"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_softcheck.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_softcheck.ini",
        content => template("artix_ncash_ini_softcheck/ncash_softcheck.erb"),
    }
}
