#!/bin/bash
updates=$(pacman -Qu | wc -l)
if [ "$updates" -gt "0" ];  then
  echo "🍺 %{F#FF0000}$updates%{F-}"
fi
echo "🍺 0"
