#/bin/bash
set -exuo pipefail

programs=$(ps -ef)
programs=$(echo "${programs}" | awk '
{
  username = $1
  cmd = $8 $9 $10 $11 $12 $13 $14 $15
  printf("%-12s | %s\n", username, cmd)
}
')

if selected=$(echo "${programs}" | sort | rofi -multi-select -dmenu -width 90 -fullscreen -matching normal); then
  pids=$(echo "$selected" | awk '{print $2}')
  echo "Killing $selected"
  echo "Killing pids:"
  echo "$pids"

  echo "$pids" | xargs -I{} kill -9 {}
fi
