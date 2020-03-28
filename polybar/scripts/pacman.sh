#!/bin/bash

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
fi

if [ "$updates_arch" -gt "0" ] || [ "$updates_aur" -gt "0" ] ;  then
  echo "🍺 %{F#FF0000}$updates_arch ($updates_aur)%{F-}"
else
  echo "🍺 $updates_arch ($updates_aur)"
fi
