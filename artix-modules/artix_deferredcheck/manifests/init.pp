class artix_deferredcheck (
    $deferredCheck_enable           = "off",
    $deferredcheck_url              = "127.0.0.1:8080",
    $deferredCheck_timeout          = "10",
    $deferredcheck_onlyDeferredMode = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "deferredcheck.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/deferredcheck.ini",
        content => template("artix_deferredcheck/deferredcheck.erb"),
    }
}
