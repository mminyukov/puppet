class artix_motp (
    $motp_enable                 = "off",
    $motp_dataMatrixMask         = "\d{14}.{15}|01\d{14}21.{7}8005\d{6}93.{4}.*",
    $motp_enableMarkVerify       = false,
    $motp_markVerifyUrl          = "localhost:8080",
    $motp_markVerifyTimeout      = "30",
    $motp_ignoreMarkVerifyErrors = true,
    $motp_enableMarkVerifyLocal  = false,
    $motp_oldTobacco             = true,
    $motp_minRetailPriceRatio    = "1",
    $motp_addWithoutScanMark     = true

)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "motp.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/motp.ini",
        content => template("artix_motp/motp.erb"),
    }
}
