#!/bin/bash

pomodoro_client="/my-tools/home-infostructure/python-scripts/pomodoro/pomodoro-client.py"
text="$(/home/igor/.config/virtual-envs/main/bin/python $pomodoro_client status 2>/tmp/aaa)"
if [ -n "$text" ]; then
  text="$(echo $text | sed 's/Pomodoro//')"
  echo "%{F#FF0000}🍅 $text%{F-}"
fi
echo "🍅 disabled"
