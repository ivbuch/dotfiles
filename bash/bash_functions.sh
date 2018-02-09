source $DOT_FILES/bash/bash_functions_docker.sh
source $DOT_FILES/bash/bash_functions_git.sh

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

# open files with editor
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
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
