#!/bin/bash
set -exuo pipefail

selected_monitor="$(xrandr --listmonitors | sed '1d' | rofi -dmenu)"
selected_monitor=$(echo "${selected_monitor}"  | cut -c 2)
selected_monitor="${selected_monitor##}"
device="Wacom Intuos BT S Pen stylus"
echo "${selected_monitor}"

xsetwacom --set "${device}" MapToOutput HEAD-"${selected_monitor}"

/my-tools/dotfiles/wacom-tablet/set-area.sh "${device}"

notify-send "Wacom tablet" "Set to monitor ${selected_monitor}"
