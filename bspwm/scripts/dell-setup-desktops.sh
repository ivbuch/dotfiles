#!/bin/bash

monitor_laptop="VGA-1"
monitor_center="VGA-2"
monitor_right="VGA-3"

source /my-tools/dotfiles/bspwm/desktops.sh

bspc desktop $d_0 --to-monitor $monitor_laptop
bspc desktop $d_1 --to-monitor $monitor_center
bspc desktop $d_2 --to-monitor $monitor_center
bspc desktop $d_3 --to-monitor $monitor_center
bspc desktop $d_4 --to-monitor $monitor_right
bspc desktop $d_5 --to-monitor $monitor_center
bspc desktop $d_6 --to-monitor $monitor_right
bspc desktop $d_7 --to-monitor $monitor_right
bspc desktop $d_8 --to-monitor $monitor_right
bspc desktop $d_9 --to-monitor $monitor_right

bspc monitor $monitor_laptop --reset-desktops $d_0
bspc monitor $monitor_center --reset-desktops $d_1 $d_2 $d_3 $d_5
bspc monitor $monitor_right --reset-desktops $d_4 $d_6 $d_7 $d_8 $d_9

bspc desktop $d_5 --focus
