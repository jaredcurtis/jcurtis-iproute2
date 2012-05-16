# Define: iproute2::table
#
# This define manages adding and removing a route table
#
# Parameters:
#  table   - routing table name
#  id      - routing table ID
#  ensure  - absent or present
#  rttable - Path to rt_tables
#
# Actions:
#
# Requires:
#
# Sample Usage:
# iproute2::table { 'add a new table':
#   id    => 200,
#   table => 'localtable',
# }
# iproute2::table { 'remove a table':
#   ensure => absent,
#   id     => 666,
#   table  => 'oldtable',
# }
#
# [Remember: No empty lines between comments and class definition]
define iproute2::table($table,$id,$ensure=present,$rttable='/etc/iproute2/rt_tables'){
  if $ensure == 'present' {
    exec { "Add iproute2 table: ${table} id: ${id} for ${name}":
      command => "/bin/sed -i '\$a\\${id} ${table}' ${rttable}",
      unless  => "/bin/grep -w '${id}\\|${table}' ${rttable}"
    }
  } elsif $ensure == 'absent' {
    exec { "Remove iproute2 table: ${table} id: ${id} for ${name}":
      command => "/bin/sed -i '/${id} ${table}/d' ${rttable}",
      onlyif  => "/bin/grep -w '${id} ${table}' ${rttable}"
    }
  } else {
    fail('Iproute2::Table requires ensure be set to present or absent')
  }
}
