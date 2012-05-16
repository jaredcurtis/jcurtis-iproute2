# Class: iproute2
#
# This module manages iproute2
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
# iproute2::route { 'fancy routing':
#   id      => 200,
#   gateway => '192.168.1.100'
# }
#
# [Remember: No empty lines between comments and class definition]
define iproute2::route($gateway,$id,$ensure=present,$rttable='/etc/iproute2/rt_tables'){
  if $ensure == 'present' {
    exec { "Add default gateway via ${gateway} for table ${id}":
      command => "/sbin/ip route add default via ${gateway} table ${id}",
      unless  => "/sbin/ip route show table ${id} | /bin/grep -w 'default via ${gateway}'",
#      notify  => Class['Iproute2::Flush']
    }
  } elsif $ensure == 'absent' {
    exec { "Remove default gateway via ${gateway} for table ${id}":
      command => "/sbin/ip route del default via ${gateway} table ${id}",
#      notify  => Class['Iproute2::Flush']
    }
  } else {
    fail('Iproute2::Route requires ensure be set to present or absent')
  }
}
