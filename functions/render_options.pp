function conntrackd::render_options(Data $value, $indent = '  ') {
  if $value =~ Hash {
    join($value.map |$k, $v| {
      if $v =~ Hash or $v =~ Array {
        $t = conntrackd::render_options($v, "${indent}  ")
        "${indent}${k} {\n${t}\n${indent}}"
      } elsif $v == undef {
        undef
      } else {
        $t = conntrackd::render_options($v, "${indent}  ")
        "${indent}${k} ${t}"
      }
    }.filter |$k, $v| { $v != undef }, "\n")
  } elsif $value =~ Array {
    join($value.map |$v| {
      $t = conntrackd::render_options($v, "${indent}  ")
      "${indent}${t}"
    }, "\n")
  } elsif $value =~ Boolean {
    if $value {
      "On"
    } else {
      "Off"
    }
  } elsif $value != undef {
    $value
  }
}
