#!/bin/bash
updates=$(pacman -Qu | wc -l)
if [ "$updates" -gt "0" ];  then
  echo "<span foreground='#ffffff' background='#ff0000'> Pacman  $updates </span>"
fi
echo "Pacman: no"
