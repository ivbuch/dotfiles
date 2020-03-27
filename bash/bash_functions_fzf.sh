# open files with editor
fzf_vim() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --reverse))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

vimf() {
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

# cd with fzf
fzf_cd() {
  dir=$(find . -not -path '*/\.*' -type d | grep -v .git | fzf)
  echo "$dir"
  cd "$dir" || return
}

cdf() {
  fzf_cd
}
