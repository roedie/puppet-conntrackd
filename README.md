# Puppet module for Conntrackd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the conntrackd module](#setup)
4. [Reference - Types reference and additional functionalities](#reference)
5. [Hiera integration](#hiera)
6. [Contact](#contact)

<a name="overview"/>

## Overview

Module to manage Conntrackd configuration and runtime. All configuration can be driven via Hiera.

<a name="module-description"/>

## Module Description

The conntracd module allows to automate the configuration and deployment of the conntrackd daemon.

<a name="setup"/>

## Setup

The include the main class as follows:

```
include conntrackd
```

<a name="reference"/>

## Reference

### Classes

#### conntrackd
`conntrackd`

```
include conntrackd
```

##### `opts` (optional)
Conntrackd options.

##### `config_dir` (optional)
Path to the configuration directory. Defaults to `/etc/conntrackd`.

##### `config_dir_purge` (optional)
Whether we should purge unmanaged resources under the conntrackd's configuration directory. Defaults to `true`.

##### `config_file` (optional)
Path to the conntrackd configuration file. Defaults to `$config_dir/conntrackd.conf`.

##### `config_file_manage` (optional)
Whether we should manage conntrackd's configuration file or not. Defaults to `true`.

##### `packages` (optional)
Installation packages for conntrackd.

Defaults to:
```
conntrackd::packages:
  "conntrackd": {}
```

##### `service_name` (optional)
Conntrackd service name. Defaults to `conntrackd`.

##### `service_manage` (optional)
Whether we should manage the service runtime or not. Defaults to `true`.

##### `service_ensure` (optional)
Whether the resource is running or not. Valid values are `running`, `stopped`. Defaults to `running`.

##### `service_enable` (optional)
Whether the service is onboot enabled or not. Defaults to `true`.

<a name="hiera"/>

## Hiera integration

You should define your configuration in Hiera. See the example below.

```
conntrackd::opts:
  "Sync":
    "Mode FTFW":
      "DisableExternalCache": false
      "CommitTimeout": 1800
      "PurgeTimeout": 5
    "UDP":
      "IPv4_address": "10.0.0.1"
      "IPv4_Destination_Address": "10.0.0.2"
      "Port": 3780
      "Interface": "eth2"
      "SndSocketBuffer": 1249280
      "RcvSocketBuffer": 1249280
      "Checksum": true
  "General":
    "Nice": -20
    "HashSize": 32768
    "HashLimit": 131072
    "LogFile": true
    "Syslog": true
    "LockFile": "/var/lock/conntrack.lock"
    "UNIX":
        "Path": "/var/run/conntrackd.ctl"
        "Backlog" 20
    "NetlinkBufferSize": 2097152
    "NetlinkBufferSizeMaxGrowth": 8388608
    "Filter From Userspace":
        "Protocol Accept":
          - TCP
          - UDP
          - ICMP
        "Address Ignore":
            "IPv4_address":
              - 127.0.0.1
```

<a name="contact"/>

## Contact

Matteo Cerutti - matteo.cerutti@hotmail.co.uk
