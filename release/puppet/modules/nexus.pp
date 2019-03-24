  class{ '::nexus':
    version    => '2.8.0',
    revision   => '05',
    nexus_root => '/srv',
  }