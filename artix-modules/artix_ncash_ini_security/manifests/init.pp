class artix_ncash_ini_security (
    $additionalRegistrationCardAddress = "http://localhost:8080/CSrest/rest/cardsmobile/card/",
    $additionalRegistrationCardTimeout = "10",
    $cardVerificationUrl               = "http://localhost:8080/CSrest/rest/ident/cards",
    $cardVerificationTimeout           = "5",
    $autoVerificationBonusLimit        = "-1",
    $minQuant                          = "0.001",
    $disableBackInDeptInSale           = false,
    $disableZeroPrice                  = true,
    $authenticateByKeyboardKey         = false,
    $keyboardKeyTimeout                = "100",
    $keyboardKey0                      = "",
    $keyboardKey1                      = "",
    $keyboardKey2                      = "",
    $keyboardKey3                      = "",
    $keyboardKey4                      = "",
    $keyboardKey5                      = "",
    $checkCashSum                      = false,
    $maxCashSum                        = "100000",
    $dangerousCashSum                  = "95000",
    $allowSeveralBackBySale            = true,
    $denyBackIfDeficiencySumGain       = false,
    $minPasswordLength                 = "0",
    $alwaysConfirmStorno               = false,
    $alwaysConfirmProcessingStorno     = false,
    $checkUserAccess                   = false,
    $forbidScanInDialog                = false,

    $shift_Duration_limit              = "23:55",
    $shift_Duration_alarmTimeout       = "15",
    $shift_Duration_enableLimit        = true,
    $shift_Duration_shiftInOneDay      = false,

    $workDay_Duration_enableLimit      = false,
    $workDay_Duration_workDayBegin     = "00:00",
    $workDay_Duration_workDayEnd       = "23:59",
    $workDay_Duration_alarmTimeout     = "15",

    $hw_locktimer_timeout              = "300"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_security.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_security.ini",
        content => template("artix_ncash_ini_security/ncash_security.erb"),
    }
}
