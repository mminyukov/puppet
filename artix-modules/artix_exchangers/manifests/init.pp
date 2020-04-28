class artix_exchangers (
    $workDirectory                                                = "/linuxcash/cash/data/tmp/exchangers",
    $logDirectory                                                 = "/linuxcash/logs/current",
    $unload_converter                                             = 'aif',
    $unload_unloadSalesInterval                                   = '10',
    $unload_unloadCurrentSalesInterval                            = '0',
    $unload_backupDir                                             = "/linuxcash/cash/data/backup/sales",
    $unload_maxCountBackupFiles                                   = '0',
    $unload_actualCountDaysForBackupFiles                         = '0',

    $unload_aif_salePath                                          = "/tmp/sale%(year)s.%(month)s.%(day)s_%(hour)s-%(min)s-%(sec)s.json",
    $unload_aif_rewriteDestFile                                   = 'True',
    $unload_aif_dataType                                          = 'sales',
    $unload_aif_flagPath                                          = "/tmp/sale.req",
    $unload_aif_onlineSalePath                                    = "/tmp/salesOnline/sale.json",

    $unload_shtrih_salePath                                       = "/tmp/sales/sale%(shiftnum)s.rep",
    $unload_shtrih_flagPath                                       = "/tmp/sales/sale.req",
    $unload_shtrih_discountsDetail                                = 'True',
    $unload_shtrih_useActorCodeForMoneyOperations                 = 'True',
    $unload_shtrih_unloadShortDateFormat                          = 'false',
    $unload_shtrih_unloadCardType                                 = 'true',
    $unload_shtrih_defaultCardType                                = '..',
    $unload_shtrih_rewriteDestFile                                = 'false',
    $unload_shtrih_unloadPaymentCommission                        = 'false',
    $unload_shtrih_charset                                        = 'windows-1251',
    $unload_shtrih_unloadPaymentByCard                            = 'False',
    $unload_shtrih_unloadBonuses                                  = 'False',
    $unload_shtrih_unloadExciseMark                               = 'False',
    $unload_shtrih_useTransaction300ForDocuments                  = 'True',
    $unload_shtrih_unloadShiftsFromKkm                            = 'False',
    $unload_shtrih_checkNumTransaction                            = '%(shiftnum)04d%(checknum)05d',
    $unload_shtrih_unloadNotOpenedShift                           = 'False',

    $unload_atol_salePath                                         = "/tmp/sales/sale%(shiftnum)s.rep",
    $unload_atol_flagPath                                         = "/tmp/sales/sale.req",
    $unload_atol_rewriteDestFile                                  = 'false',
    $unload_atol_discountsDetail                                  = 'True',
    $unload_atol_charset                                          = 'windows-1251',
    $unload_atol_onlineSalePath                                   = "/tmp/salesOnline/export.txt",

    $unload_atol_astor_salePath                                   = "/tmp/sales/sale%(shiftnum)s.rep",
    $unload_atol_astor_flagPath                                   = "/tmp/sales/sale.req",
    $unload_atol_astor_rewriteDestFile                            = 'false',
    $unload_atol_astor_discountsDetail                            = 'True',
    $unload_atol_astor_charset                                    = 'windows-1251',
    $unload_atol_astor_onlineSalePath                             = "/tmp/salesOnline/export.txt",

    $unload_smag_salePath                                         = "/tmp/sales/",
    $unload_smag_fileType                                         = 'dat',
    $unload_smag_charset                                          = 'windows-1251',
    $unload_smag_currentSalesPath                                 = "/tmp/currentSales",
    $unload_smag_earnPositionCode                                 = '999999',
    $unload_smag_earnCardNumber                                   = '99999999',
    $unload_smag_spendPaymentCode                                 = '10',
    $unload_smag_earnDeptCode                                     = '0',
    $unload_smag_appendSaleFiles                                  = 'false',
    $unload_smag_rewriteDestFile                                  = 'false',

    $unload_smag_valut_valuts                                     = [],

    $unload_oracle_salePath                                       = "/tmp/sales",

    $unload_oracle_valut_valuts                                   = [],

    $unload_oracle_measure_measures                               = [],

    $unload_ns_salePath                                           = "/tmp/sales/",
    $unload_ns_charset                                            = 'windows-1251',

    $unload_pilot_salePath                                        = "/tmp/sales/",
    $unload_pilot_charset                                         = 'windows-1251',

    $unload_crystal_salePath                                      = "/tmp/crystal/reports",
    $unload_crystal_formdiscounts                                 = 'True',

    $unload_crystal_payment_payments                              = [],

    $unload_sap_salePath                                          = "/tmp/sales/export_%(year)s%(month)s%(day)s.xml",
    $unload_sap_rewriteDestFile                                   = 'false',
    $unload_sap_onlineSalePath                                    = "/tmp/salesOnline/sales_%(year)s.%(month)s.%(day)s_%(hour)s-%(min)s-%(sec)s.xml",

    $upload_poolProcessSize                                       = '1',
    $upload_timeoutFlagFind                                       = '20',
    $upload_timeoutNodeReread                                     = '300',
    $upload_maxCountBackupFiles                                   = '0',
    $upload_actualCountDaysForBackupFiles                         = '0',
    $upload_converter                                             = 'aif',
    $upload_backupDir                                             = "/linuxcash/cash/data/backup/dicts",
    $upload_stopConvertIfBadDict                                  = 'false',
    $upload_badDictsDirectory                                     = "/linuxcash/cash/data/backup/badDicts",

    $upload_aif_flags                                             = "/tmp/dict/aif/pos*.flz",
    $upload_aif_data                                              = "/tmp/dict/aif/pos*.aif",
    $upload_aif_errorDest                                         = "/tmp/dict/aif/error.txt",

    $upload_shtrih_flags                                          = "/tmp/dict/shm/pos*.flz",
    $upload_shtrih_data                                           = "/tmp/dict/shm/pos*.spr",
    $upload_shtrih_errorDest                                      = "/tmp/dict/shm/error.txt",
    $upload_shtrih_delimiter                                      = ';',
    $upload_shtrih_cashierName                                    = 'False',
    $upload_shtrih_hotKeyByBarcode                                = 'False',
    $upload_shtrih_requireSaleRestrict                            = 'False',

    $upload_atol_flags                                            = "/tmp/dict/atol/import.flz",
    $upload_atol_data                                             = "/tmp/dict/atol/import.txt",
    $upload_atol_errorDest                                        = "/tmp/dict/atol/error.txt",

    $upload_smag_ukm_flags                                        = "/tmp/dict/smag/*.cng, /tmp/dict/smag/*.upd",
    $upload_smag_ukm_data                                         = "/tmp/dict/smag/*.dat",
    $upload_smag_ukm_errorDest                                    = "/tmp/dict/smag/error.txt",
    $upload_smag_ukm_charset                                      = 'windows-1251',
    $upload_smag_ukm_format                                       = 'dat',
    $upload_smag_ukm_defaultRoleCode                              = '3',
    $upload_smag_ukm_additionallyRoleCode                         = '2',
    $upload_smag_ukm_relationRolesBy                              = 'code',
    $upload_smag_ukm_substringInAdminName                         = 'Администратор',
    $upload_smag_ukm_usersWithAdditionallyRole                    = '1,2,3',
    $upload_smag_ukm_setMinPriceIfDiscountRestrictMissing         = 'True',

    $upload_smag_ukm_groupcatalog                                 = [],

    $upload_smag_ukm_4_flags                                      = "/tmp/dict/smag/*.cng, /tmp/dict/smag/*.upd",
    $upload_smag_ukm_4_data                                       = "/tmp/dict/smag/*.dat",
    $upload_smag_ukm_4_errorDest                                  = "/tmp/dict/smag/error.txt",
    $upload_smag_ukm_4_charset                                    = 'windows-1251',
    $upload_smag_ukm_4_format                                     = 'dat',
    $upload_smag_ukm_4_discount                                   = 'modern',
    $upload_smag_ukm_4_defaultRoleCode                            = '3',
    $upload_smag_ukm_4_additionallyRoleCode                       = '2',
    $upload_smag_ukm_4_relationRolesBy                            = 'name',
    $upload_smag_ukm_4_substringInAdminName                       = 'Администратор',
    $upload_smag_ukm_4_usersWithAdditionallyRole                  = '1,2,3',

    $upload_smag_ukm_4_groupcatalog                               = [],

    $upload_oracle_flags                                          = "/tmp/dict/oracle/*.xml",
    $upload_oracle_data                                           = "/tmp/dict/oracle/*.xml",
    $upload_oracle_errorDest                                      = "/tmp/dict/oracle/error.txt",

    $upload_oracle_measure_measures                               = [],

    $upload_users_flags                                           = "/tmp/dict/users/*.txt",
    $upload_users_data                                            = "/tmp/dict/users/users.dat",
    $upload_users_errorDest                                       = "/tmp/dict/users/error.txt",

    $upload_users_roles_usersroles                                = [],

    $upload_crystal_flags                                         = "/tmp/crystal/products/catalog*.xml,/tmp/crystal/cards/catalog*.xml,/tmp/crystal/additional/*.xml",
    $upload_crystal_data                                          = "/tmp/crystal/products/catalog*.xml,/tmp/crystal/cards/catalog*.xml,/tmp/crystal/additional/*.xml",
    $upload_crystal_errorDest                                     = "/tmp/crystal/error.txt",
    $upload_crystal_visualverifysg                                = "1,2,3",
    $upload_crystal_requirequantitymanualsg                       = "4,5,6",
    $upload_crystal_measuremap                                    = "шт-1,1007-2",

    $upload_sap_flags                                             = "tmp/dict/sap/*.xml",
    $upload_sap_data                                              = "/tmp/dict/sap/*.xml",

    $queue_host                                                   = 'localhost',
    $queue_port                                                   = '5672',
    $queue_user                                                   = 'guest',
    $queue_password                                               = 'guest',
    $queue_fileSize                                               = '128',
    $queue_fileCount                                              = '8',
    $queue_maxSize                                                = '104857600',
    $queue_maxCount                                               = '3000',
    $queue_aifObjectsCountInMessage                               = '2000',

    $soap_upload_port                                             = '18080',
    $soap_upload_maxContentLength                                 = '83886080',
    $soap_upload_authorize                                        = 'false',
    $soap_upload_login                                            = 'admin',
    $soap_upload_passwd                                           = 'admin',
    $soap_upload_sessionIdleTimeout                               = '300',
    $soap_upload_maxCountBackupRequests                           = '0',
    $soap_upload_actualCountDaysForBackupRequests                 = '3',
    $soap_upload_useSession                                       = 'False',
    $soap_upload_useValidation                                    = 'False',

    $rest_upload_port                                             = '28080',
    $rest_upload_authorize                                        = 'True',
    $rest_upload_login                                            = 'admin',
    $rest_upload_passwd                                           = 'admin',
    $rest_upload_maxCountBackupRequests                           = '0',
    $rest_upload_actualCountDaysForBackupRequests                 = '3',

    $serviceUpload                                                = true,
    $serviceUnload                                                = false,
    $serviceSoapUpload                                            = false,
    $serviceRestUpload                                            = false,
    $enable                                                       = true
)
{
    File{
        owner => root,
        group => root,
        mode  => '0644',
    }
    if $artix_exchangers::enable {
        if $artix_cashcode == undef {
            err ("The cashcode was not specify!")
        }
        file { "exchangers.ini" :
            name    => "/linuxcash/cash/exchangesystems/exchangers/config/cash/exchangers.ini",
            content => template("artix_exchangers/artix_exchangers.erb"),
            require => Package['artix45-exchangers'],
            notify  => [ Service['exchangers-upload'], Service['exchangers-unload'], Service['exchangers-soap-upload'], Service['exchangers-rest-upload'], ],
        }
    }
    package { 'artix45-exchangers' :
        ensure      => $artix_exchangers::enable ? { true => installed, default => purged, } ,
        configfiles => keep,
        provider    => aptitude,
    }
    file { "exchangers" :
        name    => "/etc/default/exchangers",
        content => template("artix_exchangers/exchangers.erb"),
        require => Package['artix45-exchangers'],
        notify  => [ Service['exchangers-upload'], Service['exchangers-unload'], Service['exchangers-soap-upload'], Service['exchangers-rest-upload'], ],
    }
    service { 'exchangers-upload' :
        ensure    => $artix_exchangers::serviceUpload ? { false => stopped, default => running, },
        hasstatus => $artix_exchangers::serviceUpload,
        enable    => $artix_exchangers::serviceUpload,
        require   => Package['artix45-exchangers'],
        provider  => "upstart",
    }
    service { 'exchangers-unload' :
        ensure    => $artix_exchangers::serviceUnload ? { false => stopped, default => running, } ,
        hasstatus => $artix_exchangers::serviceUnload,
        enable    => $artix_exchangers::serviceUnload,
        require   => Package['artix45-exchangers'],
        provider  => "upstart",
    }
    service { 'exchangers-soap-upload' :
        ensure    => $artix_exchangers::serviceSoapUpload ? { false => stopped, default => running, } ,
        hasstatus => $artix_exchangers::serviceSoapUpload,
        enable    => $artix_exchangers::serviceSoapUpload,
        require   => Package['artix45-exchangers'],
        provider  => "upstart",
    }
    service { 'exchangers-rest-upload' :
        ensure    => $artix_exchangers::serviceRestUpload ? { false => stopped, default => running, } ,
        hasstatus => $artix_exchangers::serviceRestUpload,
        enable    => $artix_exchangers::serviceRestUpload,
        require   => Package['artix45-exchangers'],
        provider  => "upstart",
    }
}
