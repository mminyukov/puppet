class artix_moot (
    $moot_enable            = "off",
    $enableMarkVerify       = false,
    $markVerifyUrl          = "localhost:8080",
    $markVerifyTimeout      = "30",
    $ignoreMarkVerifyErrors = true
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "moot.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/moot.ini",
        content => template("artix_moot/moot.erb"),
    }
}
