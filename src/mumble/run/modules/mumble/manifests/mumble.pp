class mumble::mumble {
  bash_exec { 'mkdir -p /mumble/data': }

  file { '/etc/mumble-server.ini':
    ensure => present,
    content => template('mumble/mumble-server.ini.erb'),
    mode => 644
  }
}
