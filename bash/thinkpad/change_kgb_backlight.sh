#!/bin/bash
FN="/sys/class/leds/tpacpi::kbd_backlight/brightness"
CURRENT="$(cat $FN)"
MAX="$(cat /sys/class/leds/tpacpi::kbd_backlight/max_brightness)"
NEW="$((CURRENT + 1))"
if [ "$NEW" -gt "$MAX" ]; then
  NEW="0"
fi
echo $NEW > $FN
