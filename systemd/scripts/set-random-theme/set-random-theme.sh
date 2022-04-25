#!/bin/bash
set -e

wallpapers="${HOME}/pictures/wallpapers"
wallpaper="$(find ${wallpapers} -type f -name "*.png" -or -name "*.jpg" | shuf | head -n 1)"
echo "${wallpaper}"
feh --bg-fill "${wallpaper}"
