class conntrackd::config {
  File {
    owner => "root",
    group => "root"
  }

  file {
    $conntrackd::config_dir:
      mode => "0755",
      ensure => "directory",
      recurse => true,
      purge => $conntrackd::config_dir_purge

    "${conntrackd::config_dir}/primary-backup.sh":
      mode => "0755",
      source => "puppet:///modules/conntrackd/primary-backup.sh"
  }

  if $conntrackd::config_file_manage {
    file {$conntrackd::config_file:
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
