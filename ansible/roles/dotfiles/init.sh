#!/bin/bash
set -e
set -x

WORKSPACE="$HOME/workspace"
DOT_FILES="$WORKSPACE/dotfiles"
mkdir -p $WORKSPACE

if [ ! -d "$DOT_FILES" ]; then
  cd $WORKSPACE
  git clone https://github.com/ivbuch/dotfiles.git
fi

if [ ! -d "$WORKSPACE/home-infra" ]; then
  cd $WORKSPACE
  git clone git@bitbucket.org:buchatsky/home-infra.git
fi

sudo pacman -Sy ansible

cd $DOT_FILES/ansible

ansible-playbook arch-linux.yml --ask-sudo-pass
ansible-playbook init-dotfiles.yml --ask-sudo-pass
