class artix_personaldiscount (
    $personaldiscount_enable   = "off",
    $personaldiscount_host     = "localhost",
    $personaldiscount_port     = "8080",
    $personaldiscount_timeout  = "5",
    $personaldiscount_user     = "user",
    $personaldiscount_password = "pasword"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "personaldiscount.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/personaldiscount.ini",
        content => template("artix_personaldiscount/personaldiscount.erb"),
    }
}
