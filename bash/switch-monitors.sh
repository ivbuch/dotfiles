#!/bin/bash
LAPTOP_DISPLAY="eDP-1"
EXTERNAL_DISPLAY="DP-2-3"

echo "test"
xrandr --output $LAPTOP_DISPLAY --off 
# xrandr --output $LAPTOP_DISPLAY --mode 1920x1080 
# xrandr -d :0 --output $LAPTOP_DISPLAY --auto
