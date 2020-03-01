#!/usr/bin/env sh

config_file="/my-tools/dotfiles/polybar/bspwm-config"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for i in $(polybar -m | awk -F: '{print $1}'); do 
  export MONITOR="$i" 
  polybar --config="$config_file" ivbuch --reload 2>/tmp/polybar.log &
done

echo "Bars launched..."
