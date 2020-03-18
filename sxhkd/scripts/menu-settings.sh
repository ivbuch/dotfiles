#!/bin/bash

keyboard_backlight() {
  FN="/sys/class/leds/tpacpi::kbd_backlight/brightness"
  CURRENT="$(cat $FN)"
  MAX="$(cat /sys/class/leds/tpacpi::kbd_backlight/max_brightness)"
  NEW="$((CURRENT + 1))"
  if [ "$NEW" -gt "$MAX" ]; then
    NEW="0"
  fi
  echo $NEW > $FN
}

r_random_bg="set random background"
r_show_help="show help"
r_keymap_switch="enable keymap"
r_restart_polybar="restart polybar"
r_restart_wm="restart bspwm"
r_keyboard_backlight="Keyboard backlight"

txt=$(echo "$r_random_bg
$r_show_help
$r_keymap_switch
$r_keyboard_backlight
$r_restart_polybar
$r_restart_wm
" | rofi -dmenu ])

if [ "$?" -ne 0 ] ; then
  echo "Bad choice"
  exit 0
fi

case "$txt" in

  "$r_random_bg") systemctl start set-random-theme --user ;;
  "$r_show_help") text2pdf ~/.config/sxhkd/sxhkdrc | zathura - ;;
  "$r_keymap_switch") setxkbmap "us,ru" ",winkeys" "grp:caps_toggle" ;;
  "$r_restart_polybar") /my-tools/dotfiles/polybar/bspwm-launch-polybar.sh ;;
  "$r_restart_wm") bspc wm -r ;;
  "$r_keyboard_backlight") keyboard_backlight ;;
esac
