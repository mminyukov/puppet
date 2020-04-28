class artix_cardissuance (
    $cardissuance_enable        = "off",
    $cardissuance_url           = "localhost:8094",
    $cardissuance_timeout       = "20",
    $cardissuance_inputName     = false,
    $cardissuance_inputSex      = false,
    $cardissuance_inputBirthday = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "cardissuance.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/cardissuance.ini",
        content => template("artix_cardissuance/cardissuance.erb"),
    }
}
