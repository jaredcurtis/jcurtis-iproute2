#include iproute2
iproute2::table { 'add a new table':
  id      => 200,
  table   => 'localtable',
}

iproute2::table { 'remove a new table':
  ensure  => absent,
  id      => 200,
  table   => 'localtable',
  rttable => '/tmp/rt_tables',
}
