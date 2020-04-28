class artix_ncash_ini_hwkeyboard (
    $keyboardtimeout        = "100",
    $handleStuckEnter       = false,
    $separateCodes          = false,
    $filter_msr_enable      = true,
    $filter_msr_pattern     = "^.*([;%].*\?).*$",
    $filter_msr_rule        = "",
    $filter_scanner_enable  = true,
    $filter_scanner_pattern = "^.*([;%].*\?).*$",
    $filter_scanner_rule    = ""
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "ncash_hwkeyboard.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/ncash_hwkeyboard.ini",
        content => template("artix_ncash_ini_hwkeyboard/ncash_hwkeyboard.erb"),
    }
}
