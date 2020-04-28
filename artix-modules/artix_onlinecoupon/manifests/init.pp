class artix_onlinecoupon (
    $onlinecoupon_enable  = "off",
    $onlinecoupon_prefix  = "888",
    $onlinecoupon_host    = "localhost",
    $onlinecoupon_port    = "7791",
    $onlinecoupon_timeout = "5"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "onlinecoupon.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/onlinecoupon.ini",
        content => template("artix_onlinecoupon/onlinecoupon.erb"),
    }
}
