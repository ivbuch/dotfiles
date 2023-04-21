#!/bin/bash
set -euo pipefail

/my-tools/dotfiles/wacom-tablet/list-devices.sh

echo "Enter device number"
read -r device

xrandr --listmonitors
echo "Enter monitor number"
read -r monitor

xsetwacom --set "${device}" MapToOutput HEAD-"${monitor}"

/my-tools/dotfiles/wacom-tablet/set-area.sh "${device}"
