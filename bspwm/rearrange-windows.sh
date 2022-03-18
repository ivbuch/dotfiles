#!/bin/bash
set -euo pipefail

move_to_desktop() {
  echo "move node_id:${1} wm_class_2:${2} to desktop:${3}"
  bspc node  "${1}" --to-desktop "${3}" || true
}

windows="$(bspc query -N -n .window)"
for node_id in ${windows}; do 
  title="$(xtitle ${node_id})"
  wm_class="$(xprop -id ${node_id} | grep WM_CLASS | sed 's/.* = "/"/')"
  wm_class_1=$(echo "${wm_class}" | awk -F ", " '{ print $1 }')
  wm_class_2=$(echo "${wm_class}" | awk -F ", " '{ print $2 }')

  echo "title:${title} node_id:${node_id} wm_class_1:${wm_class_1} wm_class_2:${wm_class_2}"
  case "${wm_class_2}" in
    *Alacritty*) move_to_desktop "${node_id}" ${wm_class_2} "2" ;;
    *Slack*) move_to_desktop "${node_id}" ${wm_class_2} "0" ;;
    *Chromium*) move_to_desktop "${node_id}" ${wm_class_2} "4" ;;
    *Zoom*) move_to_desktop "${node_id}" ${wm_class_2} "9" ;;
    *Firefox*) move_to_desktop "${node_id}" ${wm_class_2} "5" ;;
    *qutebrowser*) move_to_desktop "${node_id}" ${wm_class_2} "1" ;;
    *) echo "no handler for title ${title}" ;;
  esac
done
