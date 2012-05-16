# Define: iproute2::rule
#
# This define manages adding a new routing rule
#
# Parameters:
#  rule     - Rule to add see man ip for examples
#  table    - Route table to use
#  priority - Priority of the rule. Must be unique.
#  ensure   - Absent or present.
#  rttable  - Path to rt_tables
#
# Actions:
#
# Requires:
#
# Sample Usage:
# iproute2::rule { 'route from loopback'
#   rule     => 'iif lo',
#   table    => localtraffic,
#   priority => 1000,
# }
#
# [Remember: No empty lines between comments and class definition]
define iproute2::rule($rule,$table,$priority,$ensure=present,$rttable='/etc/iproute2/rt_tables') {
  if $ensure == 'present' {
    exec { "Add rule ${name}":
      command => "/sbin/ip rule add ${rule} table ${table} priority ${priority}",
      unless  => "/sbin/ip rule show | /bin/grep -w ${priority}:",
      notify  => Class['iproute2::flush']
    }
  } elsif $ensure == 'absent' {
    exec { "Remove rule ${name}":
      command => "/sbin/ip rule delete priority ${priority}",
      notify  => Class['iproute2::flush']
    }
  } else {
    fail('Iproute2::Route requires ensure be set to present or absent')
  }
}
