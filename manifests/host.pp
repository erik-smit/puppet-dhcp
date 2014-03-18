define dhcp::host (
    $ip,
    $mac,
    $comment=''
  ) {

  $host = $name
  include dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  concat::fragment { "dhcp.hosts+10_${name}.hosts":
    target  => "${dhcp_dir}/dhcp.hosts",
    content => template('dhcp/dhcpd.host.erb'),
  }

}
