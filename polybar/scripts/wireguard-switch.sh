#!/bin/bash
if ls /sys/class/net/wg0 1>/dev/null 2>/dev/null ; then
  sudo wg-quick down wg0
  notify-send "wireguard disabled"
else
  sudo wg-quick up wg0
  echo nameserver 192.168.2.1 | sudo tee /etc/resolv.conf > /dev/null
  notify-send "wireguard enabled"
fi
