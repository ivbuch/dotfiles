#!/bin/bash
ps -u 0 -f | grep openvpn 1>/dev/null 2>&1
vpn_on="$?"

msg=""

if [ $vpn_on -eq "0" ]; then
  msg="🔥%{F#FF0000}OPENVPN:" 

  msg="$msg %{F-}🔥"
fi

echo "$msg"
