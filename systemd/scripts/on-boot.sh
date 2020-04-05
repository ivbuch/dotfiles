#!/bin/bash
set -e

echo "On poweroff script $(date)" >> /tmp/on-boot.log

if [[ $DISPLAY ]] ; then 
  pkill greenclip && greenclip clear 
  echo "Greenclip cleared with display" >> /tmp/on-boot.log
else
  rm -f "$HOME/.cache/greenclip.history"
  echo "Greenclip cleared with NO display" >> /tmp/on-boot.log
fi

echo "On poweroff script end $(date)" >> /tmp/on-boot.log
