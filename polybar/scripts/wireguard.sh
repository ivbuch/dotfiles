#!/bin/bash
if ls /sys/class/net/wg0 1>/dev/null 2>/dev/null ; then
  echo "🔒 🟢"
else
  echo "🔓 🔴"
fi
