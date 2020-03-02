#!/bin/bash

case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000") KBD="EN" ;;
  "00001000") KBD="RU" ;;
  *) KBD="unknown" ;;
esac

echo $KBD
