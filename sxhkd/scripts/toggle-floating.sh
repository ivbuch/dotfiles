#!/bin/sh
# Simple script to toggle a node to fullscreen mode in bspwm
if [ -z "$(bspc query -N -n .focused.floating)" ]; then
    bspc node focused -t floating
  else
    bspc node focused -t tiled
fi
