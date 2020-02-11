#!/bin/bash
if ls /sys/class/net/wg0 1>/dev/null ; then
  echo "<span foreground='#696969' background='#32CD32'> 🔔 WIREGUARD ON 🔔 </span>"
else
  echo "<span foreground='#ffffff' background='#B03060'> 🔔 WIREGUARD OFF 🔔 </span>"
fi
