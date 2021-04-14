# open files with editor
fzf_vim() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0 --reverse))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

vf() {
  fzf_vim
}

# fzf ssh
fzf_ssh() {
  hosts=$(grep Host ~/.ssh/config -w | awk '{print $2}')
  if [ -d "$HOME/.ssh/mfss" ] ; then
    hosts="$hosts\\n$(grep Host ~/.ssh/mfss/* -w | awk '{print $2}')"
  fi  
 
  if item=$(echo "$hosts" | sort | fzf -e); then
    echo "$item" > /tmp/s_latest_host.txt
    echo "ssh $item"
    ssh "$item"
  fi
}

s(){
  fzf_ssh
}

# cd with fzf
fzf_cd() {
  output=$(find . -not -path '*/\.*' -type d | grep -v .git | awk '
  {
    print substr($0, 3)
  }
  ')
  dir=$(echo ${output} | fzf -e )
  echo "${dir}"
  cd "${dir}" || return
}

cdf() {
  fzf_cd
}


# fzf xdg-open doc
of() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0 --reverse))
  [[ -n "$files" ]] && nohup xdg-open "${files[@]}" 1>/tmp/nohup.log 2>&1 &
}

# fzf tmuxp
tm() {
  file_to_load=$(find -L $HOME/.tmuxp -maxdepth 1 -type f -printf '%f\n' | sed 's|.yml||' | sort | fzf -e --reverse )
  if [[ $? != 0 ]]; then
    return 0
  fi
  tmuxp load --yes "${file_to_load%.*}"
}

# copy filename
.cpf() {
  depth="${1:-10}"
  to_copy=$(find . -maxdepth "${depth}" | awk '{
  name = substr($0, 3)
  print name
  }' | fzf)

  if [ -z "${to_copy}" ]; then
    exit 1
  fi

  echo -n ${to_copy} | xclip -selection clipboard
  echo "\"${to_copy}\" copied to clipboard"
}

# copy filename fullpath
.cpff() {
  depth="${1:-10}"
  .cpf "${depth}"
  selected_file=$(xclip -selection clipboard -o)
  if [ -z "${selected_file}" ]; then
    exit 1
  fi
  full_name=$(readlink -f ${selected_file})
  echo -n ${full_name} | xclip -selection clipboard
  echo "\"${full_name}\" copied to clipboard"
}
