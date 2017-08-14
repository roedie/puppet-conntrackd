class conntrackd (
  Conntrackd::Options $opts,
  String $config_file,
  Boolean $config_file_manage,
  String $config_dir,
  Boolean $config_dir_purge,
  Hash $packages,
  String $service_name,
  Boolean $service_manage,
  Enum["stopped", "running"] $service_ensure,
  Boolean $service_enable
) {
  include conntrackd::install
  include conntrackd::config
  include conntrackd::service
}
