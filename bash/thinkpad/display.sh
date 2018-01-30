#!/bin/sh
EXTERNAL="DP-2-3"
LAPTOP="eDP-1"

if [ "$1" = "dual" ]; then
  xrandr --output $LAPTOP --auto --left-of $EXTERNAL --output $EXTERNAL --auto
fi
if [ "$1" = "monitor" ]; then
  xrandr --output $LAPTOP --off --output $EXTERNAL --auto
fi
if [ "$1" = "laptop" ]; then
  xrandr --output $LAPTOP --auto --output $EXTERNAL --off
fi
