class artix_discountcounters (
    $discountcounters_enable   = false,
    $discountcounters_host     = "localhost",
    $discountcounters_port     = "8080",
    $discountcounters_timeout  = "10",
    $discountcounters_user     = "admin",
    $discountcounters_password = "admin"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "discountcounters.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/discountcounters.ini",
        content => template("artix_discountcounters/discountcounters.erb"),
    }
}
