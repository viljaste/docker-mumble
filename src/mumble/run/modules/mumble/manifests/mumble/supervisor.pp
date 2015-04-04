class mumble::mumble::supervisor {
  file { '/etc/supervisor/conf.d/mumble.conf':
    ensure => present,
    content => template('mumble/mumble.conf.erb'),
    mode => 644
  }
}
