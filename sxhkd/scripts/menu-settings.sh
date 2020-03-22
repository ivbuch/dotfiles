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

r_random_bg="Set Random Background"
r_show_help="Show help"
r_keymap_switch="Enable Keymap"
r_restart_polybar="Restart Polybar"
r_restart_wm="Restart BSPWM"
r_keyboard_backlight="Keyboard Backlight"
r_dns="Change DNS"
r_disable_pihole="Disable PiHole for 30 sec"

if ! txt=$(echo "$r_random_bg
$r_show_help
$r_keymap_switch
$r_keyboard_backlight
$r_restart_polybar
$r_restart_wm
$r_dns
$r_disable_pihole
" | rofi -dmenu -i ) ; then

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
  "$r_dns") /my-tools/home-infostructure/dotfiles/bash/menu-dns-change.sh ;;
  "$r_disable_pihole") /my-tools/home-infostructure/dotfiles/bash/disable-pihole.sh 30 ;;
esac
