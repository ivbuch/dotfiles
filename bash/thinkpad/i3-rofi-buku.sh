#!/bin/sh

if selected=$(buku -p -f 4 | rofi -dmenu -fullscreen -matching normal); then
  links=$(echo "$selected" | awk '{print $1}')
  BROWSER="$1" buku -o "$links"
fi
