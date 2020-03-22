#!/bin/bash

function get_status() {
  cd "$1"
  st="$(git status 2>&1)"
  if echo "$st" | grep "ahead of" > /dev/null ; then
    return 1
  fi

  if ! echo "$st" | grep "nothing to commit" > /dev/null ; then
    return 1
  fi
  return 0
}

msg="GIT "
if get_status "/my-tools/dotfiles" ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴"
fi

if get_status "/my-tools/home-infostructure" ; then
  msg="$msg 🟢"
else
  msg="$msg 🔴"
fi

echo "$msg"
