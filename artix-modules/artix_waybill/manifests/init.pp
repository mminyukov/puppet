class artix_waybill (
  $waybill_enable        = false,
  $waybill_serverUrl     = "http://localhost:8080/",
  $waybill_timeout       = "30",
  $waybill_numberToPrint = "2",
) {
  File {
    owner => root,
    group => root,
    mode  => '0644',
  }
  file { 'ncash_waybill.ini':
    ensure  => $artix_waybill::waybill_enable ? {
      true    => file,
      default => absent
    },
    name    => '/linuxcash/cash/conf/ncash.ini.d/ncash_waybill.ini',
    content => template('artix_waybill/ncash_waybill.erb'),
  }
}