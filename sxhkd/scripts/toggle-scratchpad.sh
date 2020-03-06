##!/usr/bin/bash

pids="$(xdotool search --class scratchpad)"
for pid in $pids; do
  echo "Toggle $pid"
  bspc node "$pid" --to-desktop focused
  bspc node "$pid" --flag hidden -f
done
