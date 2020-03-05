#!/bin/bash
set -e

to_translate="$(echo | dmenu)"
[ -z "$to_translate" ] && exit 0
output="/tmp/translate_result.txt"
/opt/translate-script/translate :ru "$to_translate" -no-ansi -o "$output"
notify-send "summary" "$(cat $output)"
