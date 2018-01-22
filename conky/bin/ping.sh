#!/bin/bash
if ping -c 1 -W 2 $1 > /dev/null; then
  echo -n '${color green}Ok$color' && echo '${color gray}' && echo -n " (updated $(date +%H:%M:%S))" && echo -n '$color'
else
  echo -n '${color red}Down$color'
fi
