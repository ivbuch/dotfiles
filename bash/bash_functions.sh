source "$DOT_FILES/bash/bash_functions_docker.sh"
source "$DOT_FILES/bash/bash_functions_git.sh"

lg() {
  ls -lah | grep -i "$1"
}

t_ru() {
  translate :ru "$1" | less
} 
t_en() {
  translate ru:en "$1" | less
}

t_() {
  translate "$1" | less
}

find_term() {
  find . -type f | xargs grep -l "$1"
}

kill_java_process_by_keyword() {
  local pid
  pid=$(ps -f -u "$USER" | grep identity-server | grep -v grep | grep java | awk '{print $2}')
  if [ ! -z "$pid" ]; 
  then
    echo "kill running app, pid $pid"
    kill -9 "$pid"
  fi  
}

# open files with editor
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --reverse))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# set last wallpaper active
init_wallpaper() {
  WALLPAPERS=~/Pictures/wallpapers
  FILENAME=$(ls -Alt  | grep -v "^total" | grep -v "^l" | head -n 1 | awk '{print $9}')
  LN_NAME="$WALLPAPERS/active.jpg"
  ln -s -f "$WALLPAPERS/$FILENAME $LN_NAME"
  wal -i "$LN_NAME" && sleep 1 && i3-msg restart
}

# view markdown
markdown_view() {
  pandoc "$1" | lynx -stdin
}

# copy filename full path to clipboard
rl() {
  filename=$(readlink -f "$1")
  echo "$filename" | tr -d '[:space:]'| xclip -i -selection clipboard
  echo "Copied '$filename' to clipboard"
}

# copy filename to clipboard
rf() {
  fn=$(basename "$(readlink -f "$1")")
  echo "$fn" | tr -d '[:space:]'| xclip -i -selection clipboard
  echo "Copied '$fn' to clipboard"
}

# extract archive
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

mkdir_move() {
  mkdir "$1"
  mv "$2" "$1"
  echo "Moved $2 to $1"
}

download_youtube_audio() {
  youtube-dl -x --audio-format mp3 -o "$HOME/Music/youtube/%(title)s.%(ext)s" "$1"
}
