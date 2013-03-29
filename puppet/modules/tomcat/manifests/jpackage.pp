class jpackage {
  yumrepo {'jpackage-generic':
    descr          => 'JPackage (free), generic',
    mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0",
    failovermethod => 'priority',
    gpgcheck       => 1,
    gpgkey         => 'http://www.jpackage.org/jpackage.asc',
    enabled        => 1,
  }
}
