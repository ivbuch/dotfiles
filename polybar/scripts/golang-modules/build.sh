#!/bin/bash
set -euo pipefail

output="$HOME/.bin/go-scripts"

build_module() {
  module_name="$1"
  output_file="$output/gi-$module_name"
  go build -o $output_file  "cmd/$module_name/$module_name.go"
  echo Module built to $output_file
}

modules=( module-borg module-ip module-pacman module-git module-ip module-internet module-ports module-docker )

for module in "${modules[@]}"; do
  build_module $module
done
