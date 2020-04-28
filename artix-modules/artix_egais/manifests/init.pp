class artix_egais (
    $enable                         = false,
    $address                        = "127.0.0.1:8082",
    $serverTimeout                  = "30",
    $sendFnInfo                     = true,
    $useExciseMarkInInventory       = false,
    $sendEgaisBeforeCashlessPayment = false,
    $barcodeMask                    = "\d\d[a-zA-Z0-9]{21}\d[0-1]\d[0-3]\d{10}[a-zA-Z0-9]{31}|[a-zA-Z0-9]{150}",
    $enableAdditionalBarcode        = false,
    $additionalBarcodeMask          = "^(1[0-9]{2}-[0-9]{30}|2[0-9]{2}-[0-9]{29}|0000000)$",
    $checkAlcoCode                  = false,
    $enableExciseMarkVerifyLocal    = false,
    $enableExciseMarkVerify         = false,
    $exciseMarkVerifyUrl            = "localhost:8080",
    $exciseMarkVerifyTimeout        = "30",
    $ignoreExciseMarkVerifyErrors   = true,
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { 'ncash_egais.ini' :
        ensure  => $artix_egais::enable ? { true => file, default => absent },
        name    => '/linuxcash/cash/conf/ncash.ini.d/ncash_egais.ini',
        content => template('artix_egais/ncash_egais.erb')
    }

    file { 'egais.xml' :
        ensure  => $artix_egais::enable ? { true => file, default => absent },
        name    => '/linuxcash/cash/conf/plugins/egais.xml',
        content => template('artix_egais/egais_xml.erb')
    }

}
