#!/bin/bash
case $BLOCK_BUTTON in
    1) $TERMINAL -e sudo pacman -Syu && pacman -Qu | wc -l > ~/.pacupgrnum && pkill -RTMIN+8 i3blocks ;;
esac

pacman -Qu | wc -l | sed -e '/^0$/d' > ~/.pacupgrnum && pkill -RTMIN+8 i3blocks

cat ~/.larbs/.pacupgrnum | sed -e "/^$/d"
