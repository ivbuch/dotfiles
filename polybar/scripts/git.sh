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

get_status "/my-tools/home-infostructure"
a1="$?"

get_status "/my-tools/dotfiles"
a2="$?"

if [ "$a1" -eq "1" ] || [ "$a2" -eq "1" ] ;  then
  echo -n "%{F#FF0000}GIT  👎%{F-}"
else
  echo -n "%{F#008000}GIT%{F-}  👍"
fi
