#!/bin/bash
set -exuo pipefail

move_to_desktop() {
  echo "move node_id:${1} wm_class_2:${2} to desktop:${3}"
  bspc node  "${1}" --to-desktop "${3}" || true
}

move_nodes() {
  windows="$(bspc query -N -n .window)"
  for node_id in ${windows}; do 
    title="$(xtitle ${node_id})"
    wm_class="$(xprop -id ${node_id} | grep WM_CLASS | sed 's/.* = "/"/')"
    wm_class_1=$(echo "${wm_class}" | awk -F ", " '{ print $1 }')
    wm_class_2=$(echo "${wm_class}" | awk -F ", " '{ print $2 }')
    wm_class_2_lower=$(echo "${wm_class_2}" | awk '{ print tolower($0) }')

    echo "title:${title} node_id:${node_id} wm_class_1:${wm_class_1} wm_class_2:${wm_class_2}"
    case "${wm_class_2_lower}" in
      *alacritty*) move_to_desktop "${node_id}" ${wm_class_2} "2" ;;
      *wm_class_firefox_slack*) move_to_desktop "${node_id}" ${wm_class_2} "0" ;;
      *jetbrains-idea*) move_to_desktop "${node_id}" ${wm_class_2} "3" ;;
      *chromium*) move_to_desktop "${node_id}" ${wm_class_2} "4" ;;
      *zoom*) move_to_desktop "${node_id}" ${wm_class_2} "9" ;;
      *firefox*) move_to_desktop "${node_id}" ${wm_class_2} "5" ;;
      *qutebrowser*) move_to_desktop "${node_id}" ${wm_class_2} "1" ;;
      *) echo "no handler for title:${title}" ;;
    esac
  done
}

cleanup_desktops() {
  desktop_to_remove="Desktop"
  while true
  do
    if bspc query --desktops --names | grep ${desktop_to_remove}; then
      bspc desktop "${desktop_to_remove}" --remove
    else 
      break
    fi
  done
}

cleanup_desktops
move_nodes
