class artix_prisma (
    $prisma_host = "127.0.0.1",
    $prisma_port = "2000"
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "prisma.xml" :
        name    => "/linuxcash/cash/conf/plugins/prisma.xml",
        content => template("artix_prisma/prismaxml.erb"),
        }
}
