#!/bin/bash
V=$(pacman -Qu | wc -l | tr -d ' ') 
if [ $V == "0" ]; then
  echo -n '${color gray}No updates$color'
else
  echo -n "\${color red}Have $V updates\$color"
fi
