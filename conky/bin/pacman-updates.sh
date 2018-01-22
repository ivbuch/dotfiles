#!/bin/bash
V=$(pacman -Qu | wc -l | tr -d ' ') 
if [ $V == "0" ]; then
  echo -n '${color green}No updates$color'
else
  echo -n '${color red}Have updates$color'
fi
