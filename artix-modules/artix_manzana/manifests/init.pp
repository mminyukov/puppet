class artix_manzana (
  $manzana_enable              = "off",
  $manzana_url                 = "http://127.0.0.1/",
  $manzana_timeout             = "15",
  $manzana_user                = "",
  $manzana_password            = "",
  $manzana_organization        = "",
  $manzana_businessUnit        = "",
  $manzana_pos                 = "",
  $manzana_orgName             = "",
)
{

    File {
      owner => root,
      group => root,
      mode  => '0644',
    }

    file { 'manzana.ini':
      name    => '/linuxcash/cash/conf/ncash.ini.d/manzana.ini',
      content => template('artix_manzana/artix_manzana.erb')
    }
}