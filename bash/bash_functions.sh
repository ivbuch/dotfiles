source "$DOT_FILES/bash/bash_functions_docker.sh"
source "$DOT_FILES/bash/bash_functions_git.sh"
source "$DOT_FILES/bash/bash_functions_task.sh"
source "$DOT_FILES/bash/bash_functions_rtm.sh"
source "$DOT_FILES/bash/bash_functions_clipboard.sh"
source "$DOT_FILES/bash/bash_functions_fzf.sh"
source "$DOT_FILES/bash/bash_functions_jrnl.sh"
source "$DOT_FILES/bash/bash_functions_aws.sh"

h() {
  man $(apropos --long . | dmenu -i -l 30 | awk '{print $2, $1}' | tr -d '()')
}

lg() {
  ls -lah | grep -i "$1"
}

find_term() {
  find . -type f \! -ipath '*.git*' -print0 | xargs -0 -I{} grep -l "$1" {}
}

# view markdown
markdown_view() {
  pandoc "$1" | lynx -stdin
}

mkdir_move() {
  mkdir "$1"
  mv "$2" "$1"
  echo "Moved $2 to $1"
  cd "$1" || return
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

# echo latest s host
sl() {
  echo -n "$(cat /tmp/s_latest_host.txt)"
}

mkdir_now() {
  d=$(date +'%Y-%m-%d-----%H:%M')
  mkdir "$d"
}
