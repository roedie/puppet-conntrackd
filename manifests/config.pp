class conntrackd::config {
  file {[$conntrackd::config_dir, "${conntrackd::config_dir}/conf.d"]:
    owner => "root",
    group => "root",
    mode => "0755",
    ensure => "directory",
    recurse => true,
    purge => $conntrackd::config_dir_purge
  }

  if $conntrackd::config_file_manage {
    file {$conntrackd::config_file:
      owner => "root",
      group => "root",
      mode => "0644",
      content => epp("conntrackd/conntrackd.conf.epp", {"opts" => $conntrackd::opts})
    }
  }

  if $conntrackd::service_manage {
    File[$conntrackd::config_dir] {
      notify => Service[$conntrackd::service_name]
    }

    if $conntrackd::config_file_manage {
      File[$conntrackd::config_file] {
        notify => Service[$conntrackd::service_name]
      }
    }
  }
}
