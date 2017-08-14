class conntrackd::install {
  $conntrackd::packages.each |String $package_name, Hash $package| {
    package {$package_name:
      * => $package
    }
  }
}
