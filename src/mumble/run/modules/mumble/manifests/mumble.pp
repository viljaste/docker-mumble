class mumble::mumble {
  require mumble::mumble::supervisor

  bash_exec { 'mkdir -p /mumble/data': }

  bash_exec { 'chown -R mumble-server.mumble-server /mumble/data':
    require => Bash_exec['mkdir -p /mumble/data']
  }

  file { '/etc/mumble-server.ini':
    ensure => present,
    content => template('mumble/mumble-server.ini.erb'),
    mode => 644
  }
}
