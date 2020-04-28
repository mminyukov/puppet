#
# = Класс: artix_logger
#
# == Переменные
#
# [*basedir*]
#   Параметр определяет базовую директорию, которая должна уже существовать.
#   В специальные директории, которые определяется относительно базовой,
#   будут помещены файл с правилами преобразования штрихкодов.
#
#   Значение по молчанию: '/linuxcash/cash'
#
#  == Автор
#   Mikhail Minyukov
#

class artix_logger (
    $basedir          = "/linuxcash/cash",
    $terminallog      = "INFO",
    $frdriverlog      = "TRACE",
    $actionlog        = "INFO",
    $rfidreaderlog    = "INFO",
    $databasedumplog  = "TRACE",
    $devicemanagerlog = "INFO",
    $frinitlog        = "INFO",
    $frtestlog        = "INFO",
    $kkmservicelog    = "INFO",
    $printtextlog     = "INFO",
    $sumcorrectionlog = "INFO"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { "artix.conf" :
        name    => "${basedir}/conf/Artix/artix.conf",
        content => template("artix_logger/artixconf_logger.erb"),
    }
    file { "databasedump.conf" :
        name    => "${basedir}/conf/Artix/databasedump.conf",
        content => template("artix_logger/databasedumpconf_logger.erb"),
    }
    file { "devicemanager.conf" :
        name    => "${basedir}/conf/Artix/devicemanager.conf",
        content => template("artix_logger/devicemanagerconf_logger.erb"),
    }
    file { "logfrinit.conf" :
        name    => "${basedir}/conf/Artix/frinit.conf",
        content => template("artix_logger/frinitconf_logger.erb"),
    }
    file { "frtest.conf" :
        name    => "${basedir}/conf/Artix/frtest.conf",
        content => template("artix_logger/frtestconf_logger.erb"),
    }
    file { "kkmservice.conf" :
        name    => "${basedir}/conf/Artix/kkmservice.conf",
        content => template("artix_logger/kkmserviceconf_logger.erb"),
    }
    file { "printtext.conf" :
        name    => "${basedir}/conf/Artix/printtext.conf",
        content => template("artix_logger/printtextconf_logger.erb"),
    }
    file { "sumcorrectionservice.conf" :
        name    => "${basedir}/conf/Artix/sumcorrectionservice.conf",
        content => template("artix_logger/sumcorrectionserviceconf_logger.erb"),
    }
}