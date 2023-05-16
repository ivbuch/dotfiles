#!/bin/bash
set -euo pipefail

/my-tools/dotfiles/wacom-tablet/list-devices.sh

xrandr --listmonitors
echo "Enter monitor number"
read -r monitor

device="Wacom Intuos BT S Pen stylus"
xsetwacom --set "${device}" MapToOutput HEAD-"${monitor}"

/my-tools/dotfiles/wacom-tablet/set-area.sh "${device}"
