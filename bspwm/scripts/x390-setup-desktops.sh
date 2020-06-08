#!/bin/bash

source /my-tools/dotfiles/bspwm/desktops.sh

monitors=( $(bspc query --monitors) )

setup_3_monitors() {
  monitor_laptop="eDP1"
  monitor_center="DVI-I-1-1"
  monitor_right="DVI-I-2-2"

  source /my-tools/dotfiles/bspwm/desktops.sh

  bspc desktop "$d_0" --to-monitor $monitor_laptop
  bspc desktop $d_1 --to-monitor $monitor_center
  bspc desktop $d_2 --to-monitor $monitor_center
  bspc desktop $d_3 --to-monitor $monitor_center
  bspc desktop $d_4 --to-monitor $monitor_right
  bspc desktop $d_5 --to-monitor $monitor_center
  bspc desktop $d_6 --to-monitor $monitor_right
  bspc desktop $d_7 --to-monitor $monitor_right
  bspc desktop $d_8 --to-monitor $monitor_right
  bspc desktop $d_9 --to-monitor $monitor_right

  bspc monitor $monitor_laptop --reset-desktops "$d_0"
  bspc monitor $monitor_center --reset-desktops $d_1 $d_2 $d_3 $d_5
  bspc monitor $monitor_right --reset-desktops $d_4 $d_6 $d_7 $d_8 $d_9

  bspc desktop $d_5 --focus
}

setup_2_monitors() {
  monitor_laptop="eDP1"
  monitor_center="HDMI2"

  source /my-tools/dotfiles/bspwm/desktops.sh

  bspc desktop "$d_0" --to-monitor $monitor_laptop
  bspc desktop $d_1 --to-monitor $monitor_center
  bspc desktop $d_2 --to-monitor $monitor_center
  bspc desktop $d_3 --to-monitor $monitor_center
  bspc desktop $d_4 --to-monitor $monitor_center
  bspc desktop $d_5 --to-monitor $monitor_center
  bspc desktop $d_6 --to-monitor $monitor_center
  bspc desktop $d_7 --to-monitor $monitor_center
  bspc desktop $d_8 --to-monitor $monitor_center
  bspc desktop $d_9 --to-monitor $monitor_center

  bspc monitor $monitor_laptop --reset-desktops "$d_0"
  bspc monitor $monitor_center --reset-desktops $d_1 $d_2 $d_3 $d_5 $d_4 $d_6 $d_7 $d_8 $d_9

  bspc desktop $d_5 --focus
}

### 1 MONITOR
if [ ${#monitors[*]} -eq 1 ] ; then
  bspc monitor --reset-desktops "$d_0" "$d_1" "$d_2" "$d_3" "$d_4" "$d_5" "$d_6" "$d_7" "$d_8" "$d_9"
  exit 0
fi

### 2 MONITORS
if [ ${#monitors[*]} -eq 2 ] ; then
  setup_2_monitors
  exit 0
fi

setup_3_monitors
