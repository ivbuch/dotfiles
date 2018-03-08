#!/bin/bash
home="/home/igor"
wallpapers="$home/Pictures/wallpapers"
wallpaper="$(find $wallpapers -type f -name "*.png" -or -name "*.jpg" | shuf | head -n 1)"

$home/.config/virtual-envs/main/bin/wal -i "$wallpaper" && i3-msg restart
echo " $(date) $wallpaper" >> /var/log/set-random-themes-logs/changes.log
