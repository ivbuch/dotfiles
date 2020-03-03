#!/bin/bash
ps -u 0 -f | grep openvpn | grep prod 1> /dev/null 2>/dev/null
vpn_prod="$?"

ps -u 0 -f | grep openvpn | grep cryutm01 1> /dev/null 2>/dev/null
vpn_dev="$?"

msg=""

if [ $vpn_prod -eq "0" ] || [ $vpn_dev -eq "0" ] ; then
  msg="🔥%{F#FF0000}OPENVPN:" 

  if [ $vpn_prod -eq "0" ] ; then
    msg="$msg PROD"
  fi

  if [ $vpn_dev -eq "0" ] ; then
    msg="$msg DEV"
  fi
  msg="$msg %{F-}🔥"
fi

echo "$msg"
