class artix_egaisttn (
    $egaisttn_enable                    = "off",
    $excise_fsrarId                     = "00000000000",
    $excise_addressTTN                  = "http://localhost:8082/opt/out?refresh=true",
    $excise_addressAct                  = "http://localhost:8082/opt/in/WayBillAct_v2",
    $excise_timeout                     = "30",
    $excise_removeDocumentsFromEgais    = false,
    $nonexcise_fsrarId                  = "00000000000",
    $nonexcise_addressTTN               = "http://localhost:8082/opt/out?refresh=true",
    $nonexcise_addressAct               = "http://localhost:8082/opt/in/WayBillAct_v2",
    $nonexcise_timeout                  = "30",
    $nonexcise_removeDocumentsFromEgais = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "egaisttn.ini" :
        name    => "/linuxcash/cash/conf/ncash.ini.d/egaisttn.ini",
        content => template("artix_egaisttn/egaisttn.erb"),
    }
}
