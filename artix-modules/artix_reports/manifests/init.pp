class artix_reports (
    $basedir        = "/linuxcash/cash" )
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    if $::root_dir == undefined {
        file { "${basedir}/reports" :
            ensure       => directory,
            path         => "${basedir}/reports",
            source       => "puppet:///files/reports/",
            sourceselect => all,
            recurse      => true,
            purge        => false,
            force        => true,
        }
    }
    if $::root_dir != undefined {
        file { "${basedir}/reports" :
            ensure       => directory,
            path         => "${basedir}/reports",
            source       => "puppet:///files/${root_dir}/reports/",
            sourceselect => all,
            recurse      => true,
            purge        => false,
            force        => true,
        }
    }

}
