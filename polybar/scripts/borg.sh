#!/bin/bash

log_file="$HOME/.config/borg/date.log"

if [ ! -f "$log_file" ] ; then
  echo -n "%{F#FF0000}💔 BORG 💔%{F-}"
  exit 0
fi

b_d="$(cat "$log_file")"
c_d=$(date +"%Y-%m-%d")
days_passed="$(( ($(date -d "$c_d" +%s) - $(date -d "$b_d" +%s)) / 86400 ))"
BACKUP_EXPIRE_DAYS=14

if [ $days_passed -gt $BACKUP_EXPIRE_DAYS ] ; then
  echo "%{F#FF0000}💔 BORG 💔%{F-}"
else 
  echo  ""
fi
