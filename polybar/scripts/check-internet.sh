#!/bin/bash
# em="☢️"
ping 8.8.8.8 -w 1 -c 1 1>/dev/null 2>/dev/null
ping_r="$?"

nslookup google.com 1>/dev/null 2>/dev/null
dns_r="$?"

nslookup -timeout=1 googleadservices.com  | grep '0.0.0.0' 1>/dev/null 2>/dev/null
pihole_r="$?"

msg="☢️  INTERNET"

if [ $ping_r -eq "0" ] ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴" 
fi

if [ $dns_r -eq "0" ] ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴" 
fi

if [ $pihole_r -eq "0" ] ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴" 
fi

echo "$msg"
