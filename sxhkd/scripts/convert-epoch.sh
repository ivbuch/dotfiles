#!/bin/bash

if value=$(rofi -dmenu); then
  if x=$(epoch-converter $value 2>&1); then
    notify-send "$x"
  else
    notify-send -u critical "$x"
  fi
fi
