#!/bin/bash
home="/home/igor"
wallpapers="$home/Pictures/wallpapers"
wallpaper="$(find $wallpapers -type f -name "*.png" -or -name "*.jpg" | shuf | head -n 1)"
wallpaper="/home/igor/workspace/dotfiles/i3/active-wallpaper.jpg"
wallpaper="/home/igor/workspace/dotfiles/i3/active-wallpaper.png"
log_file="/var/log/set-random-themes-logs/changes.log"

$home/.config/virtual-envs/main/bin/wal -i "$wallpaper" >$log_file && i3-msg restart
python3 "/my-tools/dotfiles/i3/theme-changer/qutebrowser_reload.py"
echo " $(date) $wallpaper" >> "$log_file"
