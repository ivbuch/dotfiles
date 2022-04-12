#!/bin/bash

common_startapp_apps() {
  systemctl start set-random-theme --user
  /my-tools/dotfiles/polybar/bspwm-launch-polybar.sh
  /my-tools/dotfiles/polybar/launch-polybar.sh
  # compton --blur-method kawase  --blur-strength 5 --blur-background --backend glx &

  bspc rule --add Termite:startup --one-shot node="@2:/"
  # termite --name=startup &
  firefox &
  qutebrowser &
  chromium-browser &

  /home/igor/.config/virtual-envs/main/bin/flashfocus &
  setxkbmap "us,ru" ",winkeys" "grp:caps_toggle"
  udiskie --tray &
}

work_startapp_apps() {
  bspc rule -a "jetbrains-idea" desktop="${d_3}" --one-shot
  # idea &

  firefox -P "slack" --class="wm_class_firefox_slack" "https://sysdigcloud.slack.com" & 
  firefox -P "whatsapp" --class="wm_class_firefox_whatsapp" "https://web.whatsapp.com" &
}

setup_x390_desktops() {
  echo none
}

common_startapp_apps

case "$(hostname)" in
  "igordesk") work_startapp_apps ;;
  "igor-legion") work_startapp_apps ;;
  "x390") setup_x390_desktops ;;
esac
