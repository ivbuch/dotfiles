function t_ru() {
  translate :ru $1 | less
}

function t_en() {
  translate ru:en $1 | less
}

function t_() {
  translate $1 | less
}

function find_term() {
  find . -type f | xargs grep -l $1
}

function kill_java_process_by_keyword() {
  local pid=$(ps -f -u $USER | grep identity-server | grep -v grep | grep java | awk '{print $2}')
  if [ ! -z "$pid" ]; 
  then
    echo "kill running app, pid $pid"
    kill -9 $pid
  fi  
}

# checkout git branch
fgc() {
  local branches branch
  branches=$(git branch -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# checkout git branch all
fgca() {
  local branches branch
  branches=$(git branch -a -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# show commit diff
fgcd() {
  local commits commit
  commits=$(git log --name-status --abbrev-commit) 
  commit=$(echo "$commits" | fzf +m)
  id=$(echo "$commit" | cut -d\  -f2)
  git difftool $id^..$id
  echo $id
}

# open files with editor
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

select_docker_containter_and_invoke_command() {
  local branches branch
  items=$(docker ps $1 | sed '1d') 
  item=$(echo "$items" | fzf)
  item=$(echo $item | awk '{print $1}')
  eval docker $2 $item $3
} 

# remove docker container
fdr() {
  select_docker_containter_and_invoke_command "-a" "rm -f"
  echo "container $branchId removed"
}

# bash exec docker container
fd_exec() {
  select_docker_containter_and_invoke_command "" "exec -it" "bash"
}

# bash exec docker container as root
fd_exec_root() {
  local branches branch
  select_docker_containter_and_invoke_command "" "exec -u 0 -it" "bash"
}

# bash log docker container
fd_log() {
  select_docker_containter_and_invoke_command "-a" "logs -f" ""
}

# start docker container
fd_start() {
  select_docker_containter_and_invoke_command "-a" "start" ""
}

# set last wallpaper active
init_wallpaper() {
  WALLPAPERS=~/Pictures/wallpapers
  FILENAME=$(ls -Alt  | grep -v "^total" | grep -v "^l" | head -n 1 | awk '{print $9}')
  LN_NAME="$WALLPAPERS/active.jpg"
  ln -s -f $WALLPAPERS/$FILENAME $LN_NAME
  wal -i "$LN_NAME" && sleep 1 && i3-msg restart
}

# view markdown
markdown_view() {
  pandoc $1 | lynx -stdin
}
