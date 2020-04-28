class artix_ncash_ini_networktest (
    $networktest_timeout = "30",
    $networktest_host    = "127.0.0.1",
    $networktest_port    = "22"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_networktest.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_networktest.ini",
        content => template("artix_ncash_ini_networktest/ncash_networktest.erb"),
    }
}
