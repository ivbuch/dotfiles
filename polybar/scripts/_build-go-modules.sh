#!/bin/bash

build_module() {
  output="$HOME/.bin/go-scripts"
  module_name="$1"
  cd $1
  go build -o "$output/gi-$module_name" "$module_name.go"
  cd ..
}

build_module "module-borg"
build_module "module-docker"
build_module "module-pacman"
build_module "module-git"
build_module "module-ip"
build_module "module-internet"
build_module "module-ports"
