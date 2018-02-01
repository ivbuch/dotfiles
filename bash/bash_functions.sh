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

# remove docker container
fdr() {
  local branches branch
  items=$(docker ps -a | sed '1d') 
  branch=$(echo "$items" | fzf)
  branchId=$(echo $branch | awk '{print $1}')
  docker rm -f $branchId
  echo "container $branchId removed"
}

# bash exec docker container
fde() {
  local branches branch
  items=$(docker ps -a | sed '1d') 
  branch=$(echo "$items" | fzf)
  branchId=$(echo $branch | awk '{print $1}')
  docker exec -it $branchId bash
}

# bash exec docker container as root
fder() {
  local branches branch
  items=$(docker ps -a | sed '1d') 
  branch=$(echo "$items" | fzf)
  branchId=$(echo $branch | awk '{print $1}')
  docker exec -u 0 -it $branchId bash
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
mdview() {
  pandoc $1 | lynx -stdin
}
