class artix_paygate (
    $paygate_enable                = "off",
    $paygate_hosts                 = "127.0.0.1:8080",
    $paygate_user                  = "user",
    $paygate_password              = "user",
    $paygate_paymentCode           = "877887",
    $paygate_paymentBcode          = "655698",
    $paygate_paymentDepartment     = "5",
    $paygate_checkAttemts          = "15",
    $paygate_timeout               = "5",
    $paygate_printBindVerification = true,
    $paygate_paymentObject         = "1"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "paygate.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/paygate.ini",
        content => template("artix_paygate/paygate.erb"),
    }
}
