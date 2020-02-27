#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar --config=/my-tools/dotfiles/polybar/config ivbuch --reload &

for i in $(polybar -m | awk -F: '{print $1}'); do 
  export MONITOR=$i 
  polybar --config=/my-tools/dotfiles/polybar/config ivbuch --reload & 
done

if [ "$1" = "i3-restart" ]; then
  sleep 1
  i3-msg restart
fi

echo "Bars launched..."
