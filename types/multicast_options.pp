type Conntrackd::Multicast_options = Struct[{
  Optional["IPv4_address"] => String,
  Optional["Group"] => Integer,
  Optional["IPv4_interface"] => String,
  Optional["Interface"] => String,
  Optional["SndSocketBuffer"] => Integer,
  Optional["RcvSocketBuffer"] => Integer,
  Optional["Checksum"] => Boolean
}]
