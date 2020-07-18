#!/usr/bin/env sh
set -exuo pipefail

run_polybar() {
  echo "Display bar $1 on $_monitor"
  MONITOR=$_monitor polybar --config="$1" ivbuch --reload 2>/tmp/polybar.log &
}

killall -q polybar || true

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for _monitor in $(polybar -m | awk -F: '{print $1}'); do 

  bar_file="bars/$(hostname)-$_monitor-bar"
  if [ -f "$bar_file" ]; then
    run_polybar $bar_file
  else 
    run_polybar "bars/common-bar"
  fi
done

echo "Bars launched..."
