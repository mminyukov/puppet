class artix_loya (
  $loya_enable             = false,
  $loya_serverUrl          = "http://127.0.0.1/",
  $loya_timeout            = "30",
  $loya_pos                = "",
  $loya_merchantId         = "",
  $loya_user               = "",
  $loya_password           = "",
  $loya_apikey             = "",
)
  {
    File {
      owner => root,
      group => root,
      mode  => '0644',
    }

    file { 'loya.ini':
      ensure  => $artix_loya::loya_enable ? {
        true    => file,
        default => absent
      },
      name    => '/linuxcash/cash/conf/ncash.ini.d/loya.ini',
      content => template('artix_loya/loya_ini.erb')
    }
  }