#!/bin/bash

export PRINT_LOCAL_TIMEZONES=false

if value=$(rofi -dmenu -p "Epoch Converter"); then
  if x=$(epoch-converter $value 2>&1); then
    notify-send "$x"
  else
    notify-send -u critical "$x"
  fi
fi
