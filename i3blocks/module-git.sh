#!/bin/bash

# cd "$DOT_FILES"
cd "/my-tools/home-infostructure"
git status 2>&1 | grep "nothing to commit" > /dev/null
hi_s="$?"

cd "/my-tools/dotfiles"
git status 2>&1 | grep "nothing to commit" > /dev/null
df_s="$?"

if [ "$df_s" -eq "1" ];  then
  echo -n "<span foreground='#ffffff' background='#ff0000'> DF </span>"
else
  echo -n "<span> DF </span>"
fi

if [ "$hi_s" -eq "1" ];  then
  echo -n "<span foreground='#ffffff' background='#ff0000'> HI </span>"
else
  echo -n "<span> HI </span>"
fi
