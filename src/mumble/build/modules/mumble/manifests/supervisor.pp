class mumble::supervisor {
  file { '/etc/supervisor/conf.d/mumble.conf':
    ensure => present,
    source => 'puppet:///modules/mumble/etc/supervisor/conf.d/mumble.conf',
    mode => 644
  }
}
