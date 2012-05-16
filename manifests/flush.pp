# Class: iproute2::flush
#
# This class manages flushing routes after an update
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
