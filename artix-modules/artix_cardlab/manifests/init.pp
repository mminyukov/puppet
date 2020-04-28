class artix_cardlab (
    $cardlab_enable    = "off",
    $cardlab_serverUrl = "localhost",
    $cardlab_login     = "user",
    $cardlab_password  = "user"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "cardlab.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/cardlab.ini",
        content => template("artix_cardlab/cardlab.erb"),
    }
}
