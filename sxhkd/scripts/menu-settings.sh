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

restart_picom() {
  pkill -9 compton || true
  pkill -9 picom || true
  picom --experimental-backends &
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

elems=(
  "Set Random Background"
  "Show help"
  "Enable Keymap"
  "Restart Polybar"
  "Restart BSPWM"
  "Keyboard Backlight"
  "Change DNS"
  "Disable PiHole for 30 sec"
  "Switch WireGuard"
  "Start Picom"
  "Setup BSPWM Desktops"
  "Autorandr setup"
  "OpenVPN setup"
  "Open Jira"
  "Rearrange Nodes"
)

values=""
for x in "${elems[@]}"; do
  if [ -z "${values}" ]; then
    values="${x}"
    continue
  fi 
  values="${values}\\n${x}"
done


if ! txt=$(echo -e "${values}" | rofi -dmenu -i ) ; then
  echo "Bad choice"
  exit 0
fi

case "$txt" in
  "Set Random Background") change_theme ;;
  "Show help") text2pdf ~/.config/sxhkd/sxhkdrc | zathura - ;;
  "Enable Keymap") setxkbmap "us,ru" ",winkeys" "grp:caps_toggle" ;;
  "Restart Polybar") /my-tools/dotfiles/polybar/launch-polybar.sh ;;
  "Restart BSPWM") bspc wm -r ;;
  "Keyboard Backlight") keyboard_backlight ;;
  "Change DNS") /my-tools/home-infra/dotfiles/bash/menu-dns-change.sh ;;
  "Disable PiHole for 30 sec") ${HOME_INFRA}/dotfiles/bash/disable-pihole.sh 30 ;;
  "Switch WireGuard") alacritty -e "/my-tools/dotfiles/polybar/scripts/wireguard-switch.sh" ;;
  "Start Picom") restart_picom ;;
  "Setup BSPWM Desktops") "${HOME}/.config/bspwm/setup-desktops.sh" ;;
  "Autorandr setup") autorandr_setup ;;
  "OpenVPN setup") alacritty -e "/my-tools/home-infra/dotfiles/bash/enable-openvpn.sh" ;;
  "Open Jira") ${HOME_INFRA}/dotfiles/bash/jira-open.sh ;;
  "Rearrange Nodes") ${DOT_FILES}/bspwm/rearrange-nodes.sh ;;
esac
