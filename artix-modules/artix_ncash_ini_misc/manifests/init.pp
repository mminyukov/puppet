class artix_ncash_ini_misc (
    $requestReasonInBackCheck           = false,
    $showCashDrawerSum                  = true,
    $calculateRemainsOfGoods            = false,
    $considerRemainsOfGoods             = false,
    $beepNotification                   = "no",
    $bsDeptMode                         = "deny",
    $fiscalPositionName                 = "РЕГИСТРАЦИЯ ПЛАТЕЖА",
    $requiredMoneyIn                    = false,
    $closeNotOpenedShift                = false,
    $openShiftInFrOnOpenCheck           = false,
    $openShiftInFrAfterOpenInCash       = false,
    $checkTimeDiscrepancy               = true,
    $setTimeManually                    = false,
    $alcoholCaution                     = "0",
    $inputBarcodeInFreeSaleSum          = false,
    $multipleModifierQuant              = false,
    $depositOnNextShift                 = false,
    $blockWorkOfBadCounters             = false,
    $alarmUnsendMessageCount            = "0",
    $alarmUnsendMessageStep             = "1",
    $notifyAfterDaysFromLastSentCheck   = "-1",
    $requestCardBalanceIfNecessary      = false,
    $showDialogAfterPrinting            = false,
    $useBcodeParserForMsrData           = false,
    $prefixForEncryptedCoupon           = "777777",
    $disableDemoMode                    = false,
    $forbidCloseShiftOnChangeKkm        = false,
    $ignoreRequireQuantityManual        = false,
    $ignoreRequireQuantityScales        = false,
    $ignoreMinPriceWhenInputPriceManual = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_misc.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_misc.ini",
        content => template("artix_ncash_ini_misc/ncash_misc.erb"),
    }
}
