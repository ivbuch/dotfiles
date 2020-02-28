#!/bin/bash

pomodoro_client="/my-tools/home-infostructure/python-scripts/pomodoro/pomodoro-client.py"
text="$(python $pomodoro_client status)"
if [ -n "$text" ]; then
  echo "%{F#FF0000}🍅$text%{F-}"
fi
echo "🍅 pomodoro disabled"
