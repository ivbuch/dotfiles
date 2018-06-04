#!/bin/bash

set_amixer() {
  amixer set Master "$1" 
  amixer set Speaker "$1"
}

if amixer get Master | tail -n 1 | grep off; then
  set_amixer "on"
  notify-send "Volume on"
  exit 0
fi

set_amixer "off"
notify-send "Volume off"
exit 0
