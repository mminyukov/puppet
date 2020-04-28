class artix_ncash_ini_shop (
    $shop_inn      = "1111111111",
    $shop_kpp      = "111111111",
    $shop_address  = "Барнаул,ул. Калинина,116/44",
    $shop_name     = "Ритейл Сервис"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_shop.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_shop.ini",
        content => template("artix_ncash_ini_shop/ncash_shop.erb"),
    }
}
