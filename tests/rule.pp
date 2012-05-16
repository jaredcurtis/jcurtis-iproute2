iproute2::rule { 'route from loopback':
  rule     => 'iif lo',
  table    => localtable,
  priority => 1000
}

iproute2::rule { 'remove route from loopback':
  ensure   => absent,
  rule     => 'iif lo',
  table    => localtable,
  priority => 1000,
  require  => Iproute2::Rule['route from loopback']
}
