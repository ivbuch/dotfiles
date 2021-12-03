#!/bin/bash

function get_status() {
  cd "$1"
  st="$(git status 2>&1)"
  echo "$st" | grep "ahead of" > /dev/null
  if [ "$?" -eq "0" ];  then
    return 1
  fi

  echo "$st" | grep "nothing to commit" > /dev/null
  if [ "$?" -eq "1" ];  then
    return 1
  fi
  return 0
}

get_status "/my-tools/home-infra"
if [ "$?" -eq "1" ];  then
  echo -n "<span foreground='#ffffff' background='#ff0000'>HI</span>."
else
  echo -n "<span>HI</span>."
fi

get_status "/my-tools/dotfiles"
if [ "$?" -eq "1" ];  then
  echo -n "<span foreground='#ffffff' background='#ff0000'>DF</span>"
else
  echo -n "<span>DF</span>"
fi
