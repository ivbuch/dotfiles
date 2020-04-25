#!/bin/bash

build_module() {
  output="$HOME/.bin/go-scripts"
  module_name="$1"
  go build -o "$output/gi-$module_name" "$module_name/$module_name.go"
}

build_module "module-borg"
build_module "module-docker"
build_module "module-pacman"
