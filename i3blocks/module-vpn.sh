#!/bin/bash
if pgrep openvpn 1>/dev/null ; then
  echo "<span background='#ff0000'> VPN ON </span>"
fi
