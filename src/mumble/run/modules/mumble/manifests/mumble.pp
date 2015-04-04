class mumble::mumble {
  bash_exec { 'mkdir -p /mumble/data': }

  bash_exec { 'chown -R mumble-server.mumble-server /mumble/data':
    require => Bash_exec['mkdir -p /mumble/data']
  }

  file { '/etc/mumble-server.ini':
    ensure => present,
    content => template('mumble/mumble-server.ini.erb'),
    mode => 644,
    require => Bash_exec['chown -R mumble-server.mumble-server /mumble/data']
  }

  bash_exec { "murmurd -ini /etc/mumble-server.ini -supw '$supw'":
    require => File['/etc/mumble-server.ini']
  }
}
