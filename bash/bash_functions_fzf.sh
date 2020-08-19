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
  dir=$(find . -not -path '*/\.*' -type d | grep -v .git | fzf -e )
  echo "$dir"
  cd "$dir" || return
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
