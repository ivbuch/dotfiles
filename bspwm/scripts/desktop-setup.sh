#!/bin/bash

source /my-tools/dotfiles/bspwm/desktops.sh

monitor_left="DisplayPort-1"
monitor_right="DisplayPort-2"

source /my-tools/dotfiles/bspwm/desktops.sh

bspc desktop "$d_0" --to-monitor $monitor_right
bspc desktop $d_1 --to-monitor $monitor_left
bspc desktop $d_2 --to-monitor $monitor_left
bspc desktop $d_3 --to-monitor $monitor_left
bspc desktop $d_4 --to-monitor $monitor_left
bspc desktop $d_5 --to-monitor $monitor_left
bspc desktop $d_6 --to-monitor $monitor_left
bspc desktop $d_7 --to-monitor $monitor_left
bspc desktop $d_8 --to-monitor $monitor_left
bspc desktop $d_9 --to-monitor $monitor_left

bspc monitor $monitor_left --reset-desktops "$d_0"
bspc monitor $monitor_left --reset-desktops $d_1 $d_2 $d_3 $d_5 $d_4 $d_6 $d_7 $d_8 $d_9

bspc desktop $d_5 --focus
