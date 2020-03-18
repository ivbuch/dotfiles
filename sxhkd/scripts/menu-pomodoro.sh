#!/bin/bash

pomodoro_client="/my-tools/home-infostructure/python-scripts/pomodoro/pomodoro-client.py"

pomodoro() {
  "$HOME/.config/virtual-envs/main/bin/python" $pomodoro_client "$1" && notify-send "pomodoro $1"
}

r_start="Start Timer"
r_skip="Skip Timer"
r_pause="Pause Timer"

txt=$(echo "$r_start
$r_skip
$r_pause
" | rofi -dmenu)

if [ "$?" -ne 0 ] ; then
  echo "Bad choice"
  exit 0
fi

case "$txt" in 
  "$r_start") pomodoro "start" ;;
  "$r_skip") pomodoro "skip" ;;
  "$r_pause")  pomodoro "pause" ;;
esac
