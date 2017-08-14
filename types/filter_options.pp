type Conntrackd::Filter_options = Struct[{
  Optional["Protocol Accept"] => Array[Conntrackd::Filter::Protocols],
  Optional["Protocol Ignore"] => Array[Conntrackd::Filter::Protocols],
  Optional["Address Accept"] => Array[Pattern[/^IPv[46]_address /]],
  Optional["Address Ignore"] => Array[Pattern[/^IPv[46]_address /]],
  Optional["State Accept"] => Array[Conntrackd::Filter::States],
  Optional["State Ignore"] => Array[Conntrackd::Filter::States]
}]
