#/bin/bash
set -exuo pipefail

if selected=$(ps -ef | sort | rofi -multi-select -dmenu -width 90 -fullscreen -matching normal); then
  pids=$(echo "$selected" | awk '{print $2}')
  echo "Killing $selected"
  echo "Killing pids:"
  echo "$pids"

  echo "$pids" | xargs -I{} kill -9 {}
fi
