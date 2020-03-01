#!/bin/bash
if pgrep openvpn 1>/dev/null ; then
  echo "<span foreground='#ffffff' background='#B03060'> 🔔 VPN ON 🔔 </span>"
fi
