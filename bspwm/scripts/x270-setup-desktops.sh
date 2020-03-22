#!/bin/bash

monitors=( $(bspc query --monitors) )

source /my-tools/dotfiles/bspwm/desktops.sh

if [ ${#monitors[*]} -eq 1 ] ; then
  bspc monitor --reset-desktops "$d_0" "$d_1" "$d_2" "$d_3" "$d_4" "$d_5" "$d_6" "$d_7" "$d_8" "$d_9"
  exit 0
fi

### 2 MONITORS
if [ ${#monitors[*]} -eq 2 ] ; then
  monitor_laptop="eDP-1"
  monitor_center="DP-2-1"

  source /my-tools/dotfiles/bspwm/desktops.sh

  bspc desktop $d_0 --to-monitor $monitor_laptop
  bspc desktop $d_1 --to-monitor $monitor_center
  bspc desktop $d_2 --to-monitor $monitor_center
  bspc desktop $d_3 --to-monitor $monitor_center
  bspc desktop $d_4 --to-monitor $monitor_center
  bspc desktop $d_5 --to-monitor $monitor_center
  bspc desktop $d_6 --to-monitor $monitor_center
  bspc desktop $d_7 --to-monitor $monitor_center
  bspc desktop $d_8 --to-monitor $monitor_center
  bspc desktop $d_9 --to-monitor $monitor_center

  bspc monitor $monitor_laptop --reset-desktops $d_0
  bspc monitor $monitor_center --reset-desktops $d_1 $d_2 $d_3 $d_5 $d_4 $d_6 $d_7 $d_8 $d_9

  bspc desktop $d_5 --focus
  exit 0
fi

monitor_laptop="eDP-1"
monitor_center="DP-2-3"
monitor_right="DP-2-1"

bspc desktop $d_0 --to-monitor $monitor_right
bspc desktop $d_1 --to-monitor $monitor_right
bspc desktop $d_2 --to-monitor $monitor_center
bspc desktop $d_3 --to-monitor $monitor_center
bspc desktop $d_4 --to-monitor $monitor_laptop
bspc desktop $d_5 --to-monitor $monitor_right
bspc desktop $d_6 --to-monitor $monitor_laptop
bspc desktop $d_7 --to-monitor $monitor_laptop
bspc desktop $d_8 --to-monitor $monitor_laptop
bspc desktop $d_9 --to-monitor $monitor_laptop

bspc monitor $monitor_laptop --reset-desktops $d_4 $d_6 $d_7 $d_8 $d_9
bspc monitor $monitor_center --reset-desktops $d_2 $d_3
bspc monitor $monitor_right --reset-desktops $d_0 $d_1 $d_5

bspc desktop $d_5 --focus
