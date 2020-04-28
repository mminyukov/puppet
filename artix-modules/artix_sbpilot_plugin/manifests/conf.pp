#
# = Класс: artix_sbpilot_plugin::conf
#
# Этот класс используется для подготовки конфигурационных файлов клиента
# процессинговой системы Сбербанк.
#
# == Переменные
#
# [*basedir*]
#   Параметр определяет базовую директорию, которая должна уже существовать.
#   В специальную директорию, которая определяется относительно базовой,
#   будут помещены конфигурационные файлы.
#
#   Значение по молчанию: '/linuxcash/cash'
#
# [*screen_encoding*]
#   Описано в классе artix_sbpilot_plugin
#
# [*encoding*]
#   Описано в классе artix_sbpilot_plugin
#
# [*limit*]
#   Описано в классе artix_sbpilot_plugin
#
# [*dialogsOnPinpad*]
#   Описано в классе artix_sbpilot_plugin
#

class artix_sbpilot_plugin::conf (
    $screenrc_encoding,
    $encoding,
    $limit,
    $dialogsOnPinpad,
    $basedir  = "/linuxcash/cash" )
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file { ".screenrc" :
        name    => "${basedir}/paysystems/sb/.screenrc",
        content => template("artix_sbpilot_plugin/screenrc.erb"),
        replace => false,
    }

    file { "artixsb.conf" :
        name    => "${basedir}/conf/artixsb.conf",
        content => template("artix_sbpilot_plugin/artixsb.conf.erb"),
        replace => false,
    }
}
