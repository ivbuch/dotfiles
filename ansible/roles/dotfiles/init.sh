#!/bin/bash
set -e
set -x

PP="$HOME/PycharmProjects"
DOT_FILES="$PP/dotfiles"
mkdir -p $PP

if [ ! -d "$DOT_FILES" ]; then
  cd $PP
  git clone https://github.com/ivbuch/dotfiles.git
fi

if [ ! -d "$PP/home-infostructure" ]; then
  cd $PP
  git clone git@bitbucket.org:buchatsky/home-infostructure.git
fi

sudo pacman -Sy ansible

cd $DOT_FILES/ansible

ansible-playbook arch-linux.yml --ask-sudo-pass
ansible-playbook init-dotfiles.yml --ask-sudo-pass
