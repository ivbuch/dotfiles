#!/bin/bash

text="$(echo | rofi -dmenu -p 'Enter text to translate (start with r/e/m)')"
mode=$(echo "$text" | awk -F '/' '{print $1}')
word=$(echo "$text" | awk -F '/' '{print $2}')

case "$mode" in 
  "r") alacritty -e bash -c "trans :ru $word --no-ansi | less" ;;
  "e") alacritty -e bash -c "trans :en $word --no-ansi | less" ;;
  "m") alacritty -e bash -c "trans  $word --no-ansi | less" ;;
esac
