#!/bin/bash

rofi_buku() {
  if selected=$(buku -p -f 4 | rofi -dmenu -fullscreen -matching normal); then
    links=$(echo "$selected" | awk '{print $1}')
    BROWSER="$1" buku -o "$links"
  fi
}

rofi_kill() {
  if selected=$(ps -ef | sort | rofi -multi-select -dmenu -width 90 -fullscreen -matching normal); then
    pids=$(echo "$selected" | awk '{print $2}')
    echo "Killing $selected"
    echo "Killing pids:"
    echo "$pids"

    echo "$pids" | xargs -I{} kill -9 {}
  fi
}

r_firefox="firefox"
r_chromium="chromium"
r_qutebrowser="qutebrowser"
r_clipboard="clipboard"
r_keepassxc="keepassxc"
r_kill_proc="kill process"

txt=$(echo "$r_firefox
$r_chromium
$r_qutebrowser
$r_kill_proc
$r_clipboard
$r_keepassxc
" | rofi -dmenu ])

if [ "$?" -ne 0 ] ; then
  echo "Bad choice"
  exit 0
fi

case "$txt" in
  "$r_firefox") rofi_buku firefox ;;
  "$r_chromium") rofi_buku chromium ;;
  "$r_qutebrowser") rofi_buku qutebrowser ;;
  "$r_clipboard") echo -n "$(greenclip print | rofi -dmenu)" | xclip -selection clipboard ;;
  "$r_keepassxc") /my-tools/home-infostructure/dotfiles/bash/rofi-keepassxc-to-clipboard.sh ;;
  "$r_kill_proc") rofi_kill ;;
esac
