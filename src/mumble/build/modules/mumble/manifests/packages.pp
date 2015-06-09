class mumble::packages {
  package {[
      'mumble-server'
    ]:
    ensure => present
  }
}
