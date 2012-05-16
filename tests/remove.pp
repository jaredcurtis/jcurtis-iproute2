iproute2::table { 'add a new table':
  ensure  => absent,
  id      => 200,
  table   => localtraffic,
}

iproute2::route { 'fancy routing':
  ensure  => absent,
  id      => 200,
  gateway => '192.168.76.1',
  require => Iproute2::Table['add a new table']
}

iproute2::rule { 'route from loopback':
  ensure   => absent,
  rule     => 'iif lo',
  table    => localtraffic,
  priority => 1000,
  require  => Iproute2::Route['fancy routing']
}
