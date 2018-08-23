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
  find . -type f \! -ipath '*.git*' -print0 | xargs -0 -I{} grep -l "$1" {}
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
ap() {
  filename=$(readlink -f "$1")
  echo "$filename" | tr -d '[:space:]'| xclip -i -selection clipboard
  echo "Copied '$filename' to clipboard"
}

# copy filename to clipboard
fn() {
  fn=$(basename "$(readlink -f "$1")")
  echo "$fn" | tr -d '[:space:]'| xclip -i -selection clipboard
  echo "Copied '$fn' to clipboard"
}

# extract archive
ex () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"      ;;
      *.jar)        unzip "$1"     ;;
      *.war)        unzip "$1"     ;;
      *.ear)        unzip "$1"     ;;
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

who_opened_port() {
  sudo lsof -i :$1
}

opened_ports_by_pid() {
  sudo lsof -Pan -p "$1" -i
}

ipc() {
  # Copies ip address to clipboard
  i="$(ip -4 route get 8.8.8.8 | awk {'print $7'} | tr -d '\n')"
  echo -n "$i" | xclip -selection clipboard
  echo "IP $i copied to clipboard"
}

ipe() {
  printf "%20s" "Interface" "Status" "Ip"
  echo
  interfaces=$(ip addr | grep 'state UP' | sed -e 's/^[0-9]*: \(.*\):.*/\1/')
  while read -r interface; do
    ipa="$(ip address show $interface)"
    # echo "$interface - $ipa UP"
    ia="$(ip address show $ipa 2>&1 | grep -E '\w*inet .* ' | sed  's/\w*inet \([0-9\./]*\).*/\1/' | sed 's/^ *//;s/ *$//')"
    s="$(ip a show $ipa 2>&1 | head -n 1 | grep -E -o "state [A-Z]* group" | awk '{print $2}')"
    printf "%20s" "$interface" "$s" "$ia"
    echo
  done <<< "$interfaces"
}

java_heap_dump() {
  jmap -dump:format=b,file="heap-dump-$1.bin" "$1"
}  

# fzf file to vim
vf() {
  if item=$(fzf); then
    vim "$item"
  fi
}

# fzf ssh
s() {
  hosts=$(grep Host ~/.ssh/config -w | awk '{print $2}')
  if [ -d "$HOME/.ssh/mfss" ] ; then
    hosts="$hosts\\n$(grep Host ~/.ssh/mfss/* -w | awk '{print $2}')"
  fi  
 
  if item=$(echo "$hosts" | sort | fzf); then
    echo "ssh $item"
    ssh "$item"
  fi
}

# copy to clipboard from history
cf() {
  echo -n "$(greenclip print | fzf -e -i)" | xclip -selection clipboard
}

# xdg-open doc
o() {
  nohup xdg-open "$1" 1>/tmp/nohup.log 2>&1 &
}

mkdir_now() {
  d=$(date +'%Y-%m-%d-----%H:%M')
  mkdir "$d"
}

# cd with fzf
cdf() {
  dir=$(find . -type d | grep -v .git | fzf)
  echo "$dir"
  cd "$dir"
}

umount_flash() {
  sudo umount /mnt/flash-drive && notify-send "Unmounted"
}

mount_flash() {
  COLS="name,type,size,mountpoint"

  drives="$(lsblk -rpo "$COLS" | grep sda -v | grep -v luks | awk '$4==""{printf "%s (%s)\n",$1,$3}')"
  [ -z "$drives" ] && exit 0
  chosen="$(echo "$drives" | rofi -dmenu | awk '{print $1}')"
  [ -z "$chosen" ] && exit 0

  mp="/mnt/flash-drive"
  sudo -A mount "$chosen" "$mp" && notify-send "$chosen mounted to $mp."
}
