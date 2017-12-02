#!/bin/bash
set -e
set -x

PP="$HOME/PycharmProjects"
mkdir -p $PP

if [ ! -d "$PP/dotfiles" ]; then
  cd $PP
  git clone https://github.com/ivbuch/dotfiles.git
fi

if [ ! -d "$PP/home-infostructure" ]; then
  cd $PP
  git clone https://buchatsky@bitbucket.org/buchatsky/home-infostructure.git
fi

pacman -Sy ansible
