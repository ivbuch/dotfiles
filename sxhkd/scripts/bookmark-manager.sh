#/bin/bash
set -eo pipefail

browser=${1}
if [ -z "$browser" ]; then
  echo "browser not set"
  exit 1
fi

if selected=$(cat ${HOME}/.cache/bookmark-manager/work.txt  | rofi -i -dmenu --markup -markup-rows -matching normal -width 220); then
  id=$(echo "${selected}" | awk -f "${HOME_INFRA}/dotfiles/bookmarks-manager/id-parser.awk")
  urls=$(cat ${HOME}/.cache/bookmark-manager/work.yaml | yq ".[] | select(.id == ${id}) | .urls[]")

  for url in ${urls}; do 
    # restore & symbol in the url (not supported by rofi)
    url=$(echo "${url}" | sed 's|_VVV_|\&|g')
    ${browser} "${url}"
  done

  if [ "$browser" = "qutebrowser" ]; then
    bspc desktop focused -f 1
  else
    bspc desktop -f 5
  fi
fi
