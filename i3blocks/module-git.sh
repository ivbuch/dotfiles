#!/bin/bash

# cd "$DOT_FILES"
cd "$HOME_INFOSTRUCTURE"
git status -v 2>&1 | grep "nothing to commit" > /dev/null
hi_s="$?"

cd "$DOT_FILES"
git status -v 2>&1 | grep "nothing to commit" > /dev/null
df_s="$?"

hi="no"
df="no"
if [ "$hi_s" -eq "1" ];  then
  hi="yes"
fi

if [ "$df_s" -eq "1" ];  then
  df="yes"
fi

echo "<span foreground='#ffffff' background='#ff0000'>DF: $df HI: $hi </span>"
