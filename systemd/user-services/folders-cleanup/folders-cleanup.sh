#!/bin/bash
set -exuo pipefail

cleanup_folder() {
  folder="${1}"

  files_to_move="$(find ${folder} -maxdepth 1 -type f)"
  folders_to_move="$(find ${folder} -maxdepth 1 -type d -not -name '202?-??-??')"

  if [ -z "${files_to_move}" ] && [ -z "${folders_to_move}" ]; then
    echo no new files/folders...exit
    return 0
  fi

  date_folder=$(date -d "yesterday" '+%Y-%m-%d')
  dest_folder="${folder}/${date_folder}"

  mkdir -p "${dest_folder}"

  OIFS="$IFS"
  IFS=$'\n'

  for x in $(find ${folder} -maxdepth 1 -type f); do
    mv "${x}" "${dest_folder}"
  done

  for x in $(find ${folder} -maxdepth 1 -type d -not -name '202?-??-??'); do
    if [ "${x}" == "${folder}" ]; then
      continue
    fi

    mv "${x}" "${dest_folder}"
  done

  IFS="$OIFS"
}

cleanup_folder "${HOME}/pictures/screenshots"
cleanup_folder "${HOME}/downloads"
