#!/bin/bash

setup_igordesk() {
  monitor_left=DisplayPort-2
  monitor_right=DisplayPort-1

  bspc desktop ${d_0} --to-monitor ${monitor_right}
  bspc desktop ${d_1} --to-monitor ${monitor_left}
  bspc desktop ${d_2} --to-monitor ${monitor_left}
  bspc desktop ${d_3} --to-monitor ${monitor_left}
  bspc desktop ${d_4} --to-monitor ${monitor_right}
  bspc desktop ${d_5} --to-monitor ${monitor_left}
  bspc desktop ${d_6} --to-monitor ${monitor_left}
  bspc desktop ${d_7} --to-monitor ${monitor_left}
  bspc desktop ${d_8} --to-monitor ${monitor_left}
  bspc desktop ${d_9} --to-monitor ${monitor_left}

  bspc monitor ${monitor_right} --reset-desktops "${d_0}"
  bspc monitor ${monitor_left} --reset-desktops ${d_1} ${d_2} ${d_3} ${d_5} ${d_4} ${d_6} ${d_7} ${d_8} ${d_9}
}

setup_x390_desktops() {
  monitors=( $(bspc query --monitors) )

  setup_3_monitors() {
    monitor_laptop="eDP-1"
    monitor_center="DP-1"
    monitor_right="HDMI-2"

    source /my-tools/dotfiles/bspwm/desktops.sh

    bspc desktop "${d_0}" --to-monitor ${monitor_laptop}
    bspc desktop ${d_1} --to-monitor ${monitor_center}
    bspc desktop ${d_2} --to-monitor ${monitor_center}
    bspc desktop ${d_3} --to-monitor ${monitor_center}
    bspc desktop ${d_4} --to-monitor $monitor_right
    bspc desktop ${d_5} --to-monitor ${monitor_center}
    bspc desktop ${d_6} --to-monitor $monitor_right
    bspc desktop ${d_7} --to-monitor $monitor_right
    bspc desktop ${d_8} --to-monitor $monitor_right
    bspc desktop ${d_9} --to-monitor $monitor_right

    bspc monitor ${monitor_laptop} --reset-desktops "${d_0}"
    bspc monitor ${monitor_center} --reset-desktops ${d_1} ${d_2} ${d_3} ${d_5}
    bspc monitor $monitor_right --reset-desktops ${d_4} ${d_6} ${d_7} ${d_8} ${d_9}

    bspc desktop ${d_5} --focus
  }

  setup_2_monitors() {
    monitor_laptop="eDP-1"
    monitor_center="HDMI-2"

    source /my-tools/dotfiles/bspwm/desktops.sh

    bspc desktop "${d_0}" --to-monitor ${monitor_laptop}
    bspc desktop ${d_1} --to-monitor ${monitor_center}
    bspc desktop ${d_2} --to-monitor ${monitor_center}
    bspc desktop ${d_3} --to-monitor ${monitor_center}
    bspc desktop ${d_4} --to-monitor ${monitor_center}
    bspc desktop ${d_5} --to-monitor ${monitor_center}
    bspc desktop ${d_6} --to-monitor ${monitor_center}
    bspc desktop ${d_7} --to-monitor ${monitor_center}
    bspc desktop ${d_8} --to-monitor ${monitor_center}
    bspc desktop ${d_9} --to-monitor ${monitor_center}

    bspc monitor ${monitor_laptop} --reset-desktops "${d_0}"
    bspc monitor ${monitor_center} --reset-desktops ${d_1} ${d_2} ${d_3} ${d_5} ${d_4} ${d_6} ${d_7} ${d_8} ${d_9}

    bspc desktop ${d_5} --focus
  }

  case "${#monitors[*]}" in
    1) bspc monitor --reset-desktops "${d_0}" "${d_1}" "${d_2}" "${d_3}" "${d_4}" "${d_5}" "${d_6}" "${d_7}" "${d_8}" "${d_9}" ;;
    2) setup_2_monitors ;;
    3) setup_3_monitors ;;
  esac
}

case "$(hostname)" in
  "igordesk") setup_igordesk ;;
  "x390") setup_x390_desktops ;;
esac
