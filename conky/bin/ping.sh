#!/bin/bash
if ping -c 1 -W 2 $1 > /dev/null; then
  echo -n '$alignr${color green}Ok$color' && echo -n '${color gray}' && echo -n " (updated $(date +%H:%M:%S))" && echo -n '$color'
else
  echo -n '$alignr${color red}Down$color'
fi
