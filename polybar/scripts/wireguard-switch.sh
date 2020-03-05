#!/bin/bash
if ls /sys/class/net/wg0 1>/dev/null 2>/dev/null ; then
  sudo wg-quick down wg0
  notify-send "wireguard disabled"
else
  sudo wg-quick up wg0
  notify-send "wireguard enabled"
fi
