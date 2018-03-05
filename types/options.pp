type Conntrackd::Options = Struct[{
  Optional["General"] => Struct[{
    Optional["Systemd"] => Boolean,
    Optional["Nice"] => Integer[-20, 19],
    Optional["HashSize"] => Integer,
    Optional["HashLimit"] => Integer,
    Optional["LogFile"] => Variant[Boolean, String],
    Optional["Syslog"] => Variant[Boolean, String],
    Optional["LockFile"] => String,
    Optional["NetlinkBufferSize"] => Integer,
    Optional["NetlinkBufferSizeMaxGrowth"] => Integer,
    Optional["NetlinkOverrunResync"] => Variant[Boolean, Integer],
    Optional["NetlinkEventsReliable"] => Boolean,
    Optional["PollSecs"] => Integer,
    Optional["EventIterationLimit"] => Integer,
    Optional["UNIX"] => Struct[{
      "Path" => String,
      "Backlog" => Integer
    }],
    Optional["Filter From Userspace"] => Conntrackd::Filter_options,
    Optional["Filter From Kernelspace"] => Conntrackd::Filter_options,
    Optional["Filter"] => Conntrackd::Filter_options
  }],
  Optional["Stats"] => Struct[{
    Optional["LogFile"] => Variant[Boolean, String],
    Optional["NetlinkEventsReliable"] => Boolean,
    Optional["Syslog"] => Variant[Boolean, String]
  }],
  Optional["Sync"] => Struct[{
    Optional["Mode FTFW"] => Struct[{
      Optional["ResendQueueSize"] => Integer,
      Optional["CommitTimeout"] => Integer,
      Optional["PurgeTimeout"] => Integer,
      Optional["ACKWindowSize"] => Integer,
      Optional["DisableExternalCache"] => Boolean
    }],
    Optional["Mode ALARM"] => Struct[{
      Optional["RefreshTime"] => Integer,
      Optional["CacheTimeout"] => Integer,
      Optional["CommitTimeout"] => Integer,
      Optional["PurgeTimeout"] => Integer
    }],
    Optional["Mode NOTRACK"] => Struct[{
      Optional["DisableInternalCache"] => Boolean,
      Optional["DisableExternalCache"] => Boolean,
      Optional["CommitTimeout"] => Integer,
      Optional["PurgeTimeout"] => Integer
    }],
    Optional["Multicast"] => Conntrackd::Multicast_options,
    Optional["Multicast Default"] => Conntrackd::Multicast_options,
    Optional["UDP"] => Struct[{
      Optional["IPv4_address"] => String,
      Optional["IPv6_address"] => String,
      Optional["IPv4_Destination_Address"] => String,
      Optional["IPv6_Destionation_Address"] => String,
      Optional["Port"] => Integer[1, 65535],
      Optional["Interface"] => String,
      Optional["SndSocketBuffer"] => Integer,
      Optional["RcvSocketBuffer"] => Integer,
      Optional["Checksum"] => Boolean
    }],
    Optional["TCP"] => Struct[{
      Optional["TCPWindowTracking"] => Boolean,
      Optional["ExpectationSync"] => Variant[Boolean, Array[String]],
    }]
  }]
}]
