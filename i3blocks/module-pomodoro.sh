#!/bin/bash

text="$(python /my-tools/home-infostructure/python-scripts/pomodoro/pomodoro-client.py status)"
if [ -n "$text" ]; then
  echo "🍅 <span foreground='#ffffff' background='#235ba8'>$text</span>"
fi
echo "🍅 pomodoro disabled"
