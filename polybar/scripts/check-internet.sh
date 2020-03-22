#!/bin/bash

ping 8.8.8.8 -w 1 -c 1 1>/dev/null 2>/dev/null
ping_r="$?"

nslookup google.com 1>/dev/null 2>/dev/null
dns_r="$?"

nslookup -timeout=1 googleadservices.com  | grep '0.0.0.0' 1>/dev/null 2>/dev/null
pihole_r="$?"

msg="☢️  INTERNET"

wireguard_status() {
  if ls /sys/class/net/wg0 1>/dev/null 2>/dev/null ; then
    echo "🔒 🟢"
  else
    echo "🔓 🟡"
  fi
}

if [ $ping_r -eq "0" ] ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴" 
fi

msg="$msg"
if [ $dns_r -eq "0" ] ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴" 
fi

msg="$msg   📛"
if [ $pihole_r -eq "0" ] ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴" 
fi

wg=$(wireguard_status)

echo "$msg   $wg"
