#
# = Класс: artix_bcode
#
# Этот класс используется для управления правилами преобразования штрихкодов.
#
# == Переменные
#
# [*rules*]
#   Перечень правил преобразований штрихкодов.
#
#   Значение по молчанию: []


class artix_bcode (
    $copy_file_enable = false,
    $rules       = []
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    if $artix_bcode::copy_file_enable {
        if $::root_dir == undefined {
            file { "bcode.ini" :
                path   => "/linuxcash/cash/conf/bcode.ini",
                source => "puppet:///files/conf/bcode.ini",
            }
        }
        if $::root_dir != undefined {
            file { "bcode.ini" :
                path   => "/linuxcash/cash/conf/bcode.ini",
                source => "puppet:///files/${root_dir}/conf/bcode.ini",
            }
        }
    }
    else {
        file { "bcode.ini" :
            name    => "/linuxcash/cash/conf/bcode.ini",
            content => template("artix_bcode/artix_bcode.erb"),
        }
    }
}