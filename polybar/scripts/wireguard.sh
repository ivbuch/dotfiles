#!/bin/bash
if ls /sys/class/net/wg0 1>/dev/null 2>/dev/null ; then
  echo "🔒 %{F#008000}WIREGUARD ON%{F-}"
else
  echo "🔓 %{F#FF0000}WIREGUARD OFF%{F-}"
fi
