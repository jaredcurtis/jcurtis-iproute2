include iproute2
iproute2::table { 'add localtraffic table':
  id      => 200,
  table   => localtraffic,
}

iproute2::route { 'fancy routing':
  id      => 200,
  gateway => '10.13.37.1',
  require => Iproute2::Table['add localtraffic table']
}

iproute2::rule { 'route from loopback':
  rule     => 'iif lo',
  table    => localtraffic,
  priority => 1000,
  require  => Iproute2::Route['fancy routing']
}
