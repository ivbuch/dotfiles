#!/bin/bash

pomodoro_client="/my-tools/home-infostructure/python-scripts/pomodoro/pomodoro-client.py"

label() {
  text=$("$HOME/.config/virtual-envs/main/bin/python" "$pomodoro_client" status 2>/tmp/aaa)
  if [ -n "$text" ]; then
    text=$(echo "$text" | sed 's/Pomodoro//')
    echo "%{F-}🍅 $text%{F-}"
    exit 0
  fi
  echo "🍅 disabled"
}

pomodoro() {
  "$HOME/.config/virtual-envs/main/bin/python" $pomodoro_client "$1" && notify-send "pomodoro $1"
}

case "$1" in 
  "label") label ;;
  "start") pomodoro "start" ;;
  "skip")  pomodoro "skip" ;;
  "pause") pomodoro "pause" ;;
  "status") pomodoro "status" ;;
esac
