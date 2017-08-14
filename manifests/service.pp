class conntrackd::service {
  if $conntrackd::service_manage {
    service {$conntrackd::service_name:
      ensure => $conntrackd::service_ensure,
      enable => $conntrackd::service_enable,
      subscribe => Package[keys($conntrackd::packages)]
    }
  }
}
