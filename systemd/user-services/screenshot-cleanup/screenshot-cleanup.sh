#!/bin/bash
set -exuo pipefail

files="$(find ~/pictures/screenshots -maxdepth 1 -type f)"

if [ -z "${files}" ]; then
  echo no new files...exit
  exit 0
fi

date_folder=$(date -d "yesterday" '+%Y-%m-%d')
dest_folder="${HOME}/pictures/screenshots/${date_folder}"

mkdir -p "${dest_folder}"

for x in ${files}; do
  mv "${x}" "${dest_folder}"
done
