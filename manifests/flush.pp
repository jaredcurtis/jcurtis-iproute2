# Class: iproute2::flush
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
#
# [Remember: No empty lines between comments and class definition]
class iproute2::flush {
  exec { 'flush routes':
    command     => '/sbin/ip route flush table cache',
    refreshonly => true,
  }
}
