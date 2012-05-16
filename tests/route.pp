include iproute2
iproute2::route { 'fancy routing':
  id      => 200,
  gateway => '192.168.76.1'
}

iproute2::route { 'remove fancy routing':
  ensure  => absent,
  id      => 200,
  gateway => '192.168.1.100',
  rttable => '/tmp/rt_tables',
  require => Iproute2::Route['fancy routing']
}
