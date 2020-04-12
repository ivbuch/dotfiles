#!/bin/bash
set -e 
wallpapers="$HOME/pictures/wallpapers"
wallpaper="$(find $wallpapers -type f -name "*.png" -or -name "*.jpg" | shuf | head -n 1)"
log_file="/var/log/set-random-themes-logs/changes.log"

echo $wallpaper

$HOME/.config/virtual-envs/main/bin/wal -i "$wallpaper" >$log_file
echo " $(date) $wallpaper" >> "$log_file"
