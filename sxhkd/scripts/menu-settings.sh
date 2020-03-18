#!/bin/bash

random_bg="set random background"
show_help="show help"
keymap_switch="enable keymap"
restart_polybar="restart polybar"
restart_wm="restart bspwm"

txt=$(echo "$random_bg
$show_help
$keymap_switch
$restart_polybar
$restart_wm
" | rofi -dmenu ])

if [ "$?" -ne 0 ] ; then
  echo "Bad choice"
  exit 0
fi

case "$txt" in

  "$random_bg") systemctl start set-random-theme --user ;;
  "$show_help") text2pdf ~/.config/sxhkd/sxhkdrc | zathura - ;;
  "$keymap_switch") setxkbmap "us,ru" ",winkeys" "grp:caps_toggle" ;;
  "$restart_polybar") /my-tools/dotfiles/polybar/bspwm-launch-polybar.sh ;;
  "$restart_wm") bspc wm -r ;;

esac
