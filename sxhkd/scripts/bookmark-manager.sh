#!/bin/bash

if selected=$(cat $HOME/.cache/bookmark-manager/work.txt  | rofi -dmenu -markup-rows -matching normal); then
  link=$(echo "$selected" | awk -F '|' '{print $3}')
  $1 "$link"
fi
