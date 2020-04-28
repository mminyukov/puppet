class artix_online_card (
    $online_card_enable   = false,
    $online_card_url      = "http://localhost:8080",
    $online_card_user     = "user",
    $online_card_password = "password"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "artixbonus.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/artixbonus.ini",
        content => template("artix_online_card/online_card.erb"),
    }
}
