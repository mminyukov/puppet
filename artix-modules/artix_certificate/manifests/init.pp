class artix_certificate (
    $server_host              = "127.0.0.1",
    $server_port              = "7791",
    $connectTimeout           = "2000",
    $recvTimeout              = "10000",
    $sendTimeout              = "10000",
    $useCertificateAsDiscount = false,
    $onlineSaleCertificates   = true,
    $sellFullCertificates     = false,
    $checkCertificateStatus   = false
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { "artix_certificate.xml" :
        name    => "/linuxcash/cash/conf/plugins/artix_certificate.xml",
        content => template("artix_certificate/artix_certificate.erb"),
    }
}
