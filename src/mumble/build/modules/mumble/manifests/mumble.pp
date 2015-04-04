class mumble::mumble {
  file { '/tmp/umurmur-0.2.15.tar.gz':
    ensure => present,
    source => 'puppet:///modules/mumble/tmp/umurmur-0.2.15.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf umurmur-0.2.15.tar.gz':
    require => File['/tmp/umurmur-0.2.15.tar.gz']
  }

  bash_exec { 'cd /tmp/umurmur-0.2.15 && ./configure':
    timeout => 0,
    require => Bash_exec['cd /tmp && tar xzf umurmur-0.2.15.tar.gz']
  }

  bash_exec { 'cd /tmp/umurmur-0.2.15 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/umurmur-0.2.15 && ./configure']
  }

  bash_exec { 'cd /tmp/umurmur-0.2.15 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/umurmur-0.2.15 && make']
  }
}
