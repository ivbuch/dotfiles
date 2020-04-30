#!/bin/bash

if selected=$(cat $HOME/.cache/bookmark-manager/work.txt  | rofi -i -dmenu --markup -markup-rows -matching normal -width 80); then
  link=$(echo "$selected" | awk -F '|' '{print $3}')

  # restore & symbol in the url (not supported by rofi)
  link=$(echo "$link" | sed 's|_VVV_|\&|g')
  firefox "$link"
fi
