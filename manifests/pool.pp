define dhcp::pool (
    $network,
    $mask,
    $range = false,
    $gateway = false
  ) {

    include dhcp::params

    $dhcp_dir = $dhcp::params::dhcp_dir

    concat::fragment { "dhcpd.conf+70_${name}.dhcp":
      target  => "${dhcp_dir}/dhcpd.conf",
      content => template('dhcp/dhcpd.pool.erb'),
    }

}
