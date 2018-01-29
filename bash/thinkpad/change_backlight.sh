#!/bin/bash
FN="/sys/class/backlight/intel_backlight/brightness"
VALUE=$(cat $FN)
STEP=50
if [[ $1 == "increment" ]]; then
  UPDATED=$(($VALUE + $STEP))
fi

if [[ $1 == "decrement" ]]; then
  UPDATED=$(($VALUE - $STEP))
fi

echo $UPDATED > $FN
