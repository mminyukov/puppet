#
# = Класс: artix_sbpilot_plugin::basedir
#
# Этот класс создает базовые директории для конфигурационных файлов модуля
# интеграции Артикс с процессиговой системой Сбербанк.
#
# == Переменные
#
# [*basedir*]
#   Параметр определяет базовую директорию, которая должна уже существовать.
#   В указанной директории будут созданны поддиректории для размещения
#   настроек.
#
#   Значение по молчанию: '/linuxcash/cash'
#
#
class artix_sbpilot_plugin::basedir (
    $basedir = "/linuxcash/cash"
)
{
    file { [ "${basedir}/paysystems/sb", ] :
        ensure => directory,
        owner  => root,
        group  => root,
        mode   => '0777',
    }
}
