class artix_frinit (
    $interact                  = true,
    $synctime                  = "fromcashtofr",
    $inifile                   = "/linuxcash/cash/conf/ncash.ini",
    $setcliche                 = false,
    $setGraphicCliche          = false,
    $settail                   = false,
    $setparams                 = false,
    $setparamsext              = false,
    $useSeparateClicheAndTail  = false,
    $graphicClicheFile         = "/linuxcash/cash/conf/cliche.bmp",
    $loadFont                  = false,
    $fontFile                  = "/linuxcash/cash/conf/fontfile.format",
    $setCheckTemplate          = false,
    $checkTemplateFile         = "/linuxcash/cash/conf/template.csv",
    $checkTemplateNumber       = "1",
    $cliche_upgrade            = false,
    $cliches                   = [],
    $tails                     = [],

)
{
    file { "frinit.conf" :
        name    => "/linuxcash/cash/conf/frinit.conf",
        content => template("artix_frinit/frinit.erb"),
        owner   => root,
        group   => root,
        mode    => '0644',
    }

    if $artix_frinit::cliche_upgrade {
        file { "cliche.txt" :
            name    => "/linuxcash/cash/conf/cliche.txt",
            content => template("artix_frinit/cliche.erb"),
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
        }
        file { "tail.txt" :
            name    => "/linuxcash/cash/conf/tail.txt",
            content => template("artix_frinit/tail.erb"),
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
        }

    }
}