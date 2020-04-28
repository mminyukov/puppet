class artix_ncash_ini_proxy (
  $proxy_hostname = "127.0.0.1",
  $proxy_port     = "3128",
  $proxy_user     = "user",
  $proxy_password = "pass"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_proxy.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_proxy.ini",
        content => template("artix_ncash_ini_proxy/ncash_proxy.erb"),
    }
}
