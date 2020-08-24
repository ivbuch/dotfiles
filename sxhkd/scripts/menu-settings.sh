#!/bin/bash

autorandr_setup() {
  if selected=$(autorandr | grep -v current | awk '{print $1}' | rofi -dmenu -matching normal); then
    autorandr --load "$selected"
  fi
}

change_theme() {
  systemctl start set-random-theme --user
  /my-tools/dotfiles/polybar/bspwm-launch-polybar.sh
}

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
r_wireguard_switch="Switch WireGuard"
r_picom_start="Start Picom"
r_setup_desktops="Setup BSPWM Desktops"
r_autorandr="Autorandr setup"
r_vpn="OpenVPN setup"

if ! txt=$(echo "$r_random_bg
$r_show_help
$r_wireguard_switch
$r_keymap_switch
$r_keyboard_backlight
$r_restart_polybar
$r_restart_wm
$r_dns
$r_disable_pihole
$r_picom_start
$r_setup_desktops
$r_autorandr
$r_vpn
" | rofi -dmenu -i ) ; then

  echo "Bad choice"
  exit 0
fi

case "$txt" in
  "$r_random_bg") change_theme ;;
  "$r_show_help") text2pdf ~/.config/sxhkd/sxhkdrc | zathura - ;;
  "$r_keymap_switch") setxkbmap "us,ru" ",winkeys" "grp:caps_toggle" ;;
  "$r_restart_polybar") /my-tools/dotfiles/polybar/launch-polybar.sh ;;
  "$r_restart_wm") bspc wm -r ;;
  "$r_keyboard_backlight") keyboard_backlight ;;
  "$r_dns") /my-tools/home-infostructure/dotfiles/bash/menu-dns-change.sh ;;
  "$r_disable_pihole") /my-tools/home-infostructure/dotfiles/bash/disable-pihole.sh 30 ;;
  "$r_wireguard_switch") termite -e "/my-tools/dotfiles/polybar/scripts/wireguard-switch.sh" ;;
  "$r_picom_start") compton --blur-method kawase  --blur-strength 5 --blur-background --backend glx  ;;
  "$r_setup_desktops") "$HOME/.config/bspwm/setup-desktops.sh" ;;
  "$r_autorandr") autorandr_setup ;;
  "$r_vpn") termite -e "/my-tools/home-infostructure/dotfiles/bash/enable-openvpn.sh" ;;
esac
