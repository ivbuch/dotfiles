#/bin/bash
set -exo pipefail

browser=${1}
if [ -z "$browser" ]; then
  echo "browser not set"
  exit 1
fi


if selected=$(cat $HOME/.cache/bookmark-manager/work.txt  | rofi -i -dmenu --markup -markup-rows -matching normal -width 80); then
  link=$(echo "$selected" | awk -F '|' '{print $3}')
  echo $link
  link=$(echo "$link" | sed 's|<span.*>\(.*\)</span>|\1|')
  echo $link

  # restore & symbol in the url (not supported by rofi)
  link=$(echo "$link" | sed 's|_VVV_|\&|g')
  $browser "$link"

  if [ "$browser" = "qutebrowser" ]; then
    bspc desktop focused -f 1-QUTE
  else
    bspc desktop  -f 5-FIREFOX
  fi
fi
