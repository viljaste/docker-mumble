class mumble::mumble::packages {
  package {[
      'mumble-server'
    ]:
    ensure => present
  }
}
