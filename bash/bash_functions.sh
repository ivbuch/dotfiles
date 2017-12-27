function t_ru() {
  translate :ru $1 | less
}

function t_en() {
  translate ru:en $1 | less
}

function t_() {
  translate $1 | less
}

function kill_java_process_by_keyword() {
  local pid=$(ps -f -u $USER | grep identity-server | grep -v grep | grep java | awk '{print $3}')
  if [ ! -z "$pid" ]; 
  then
    echo "kill running app, pid $pid"
    kill -9 $pid
  fi  
}

# fbr - checkout git branch
fgb() {
  local branches branch
  branches=$(git branch -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch all
fgba() {
  local branches branch
  branches=$(git branch -a -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# open files with editor
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# remove docker container
fdr() {
  local branches branch
  items=$(docker ps -a | sed '1d') 
  branch=$(echo "$items" | fzf)
  branchId=$(echo $branch | awk '{print $1}')
  docker rm -f $branchId
  echo "container $branchId removed"
}
