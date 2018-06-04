#!/bin/bash
FN="/sys/class/backlight/intel_backlight/brightness"
VALUE="$(cat $FN)"
MAX="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
STEP="50"
MIN="50"
if [[ $1 == "increment" ]]; then
  UPDATED=$((VALUE + STEP))
  if [ $UPDATED -gt "$MAX" ]; then
    UPDATED="$MAX"
  fi
fi

if [[ $1 == "decrement" ]]; then
  UPDATED=$(($VALUE - $STEP))
  if [ $UPDATED -lt "$MIN" ]; then
    UPDATED="$MIN"
  fi
fi

echo $UPDATED > $FN
notify-send "Brightness set to $UPDATED"
