class artix_bonus (
    $server_host                      = $::artix_cs_ip,
    $server_port                      = "7791",
    $connectTimeout                   = "2000",
    $recvTimeout                      = "10000",
    $sendTimeout                      = "10000",
    $roundPrecision                   = "0.1",
    $roundModeForEarn                 = "roundToDown",
    $roundPrecisionForSpend           = "0.01",
    $proportionalEarnBonus            = false,
    $useDiscOnChange                  = false,
    $cancelBonusOnlyOnPosition        = false,
    $inputClientInfo                  = false,
    $calculateDummyPoints             = false,
    $dummyCardNumber                  = "",
    $proportionalSpendBonusOnPosition = false,
    $cancelEarnBonusWithID            = false,
    $printDetailedBonusInfo           = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "artix_bonus.xml" :
        name    => "/linuxcash/cash/conf/plugins/artix_bonus.xml",
        content => template("artix_bonus/artix_bonus.erb"),
    }
    file { '/linuxcash/cash/conf/plugins/bonus.xml' :
        ensure  => 'absent',
    }
}
