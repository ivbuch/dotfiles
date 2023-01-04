source "$DOT_FILES/bash/bash_functions_docker.sh"
source "$DOT_FILES/bash/bash_functions_git.sh"
source "$DOT_FILES/bash/bash_functions_task.sh"
source "$DOT_FILES/bash/bash_functions_rtm.sh"
source "$DOT_FILES/bash/bash_functions_clipboard.sh"
source "$DOT_FILES/bash/bash_functions_fzf.sh"
source "$DOT_FILES/bash/bash_functions_jrnl.sh"
source "$DOT_FILES/bash/bash_functions_aws.sh"
source "$DOT_FILES/bash/bash_functions_vm.sh"
source "$DOT_FILES/bash/bash_functions_kafka.sh"
source "$DOT_FILES/bash/bash_functions_k8s.sh"

bk() {
  for arg in "$@"; do
    echo Backing up with cp "${arg}" "${arg}.bk"
    cp "${arg}" "${arg}.bk"
  done
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

### .mkdir-move-file-to-new-dir !!! create dir $2 and move file $1 into it
.mkdir-move-file-to-new-dir() {
  mkdir "$2"
  mv "$1" "$2"
  echo "Moved $1 to $2"
  cd "$2" || return
}

### .mkdir-now !!! create dir timestampt and cds into it
.mkdir-now() {
  d=$(date +'%Y-%m-%d-----%H:%M')
  mkdir "$d"
  cd "${d}"
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

### .f !!! select alias
.f() {
  selected=$(grep -E "^###" --color=never ${DOT_FILES}/bash/*func*.sh ${HOME_INFRA}/dotfiles/zsh/*func*.sh --no-filename | awk '
    {
      v = substr($0, 5)
      split(v, fields, " !!! ")
      alias = fields[1]
      comment = fields[2]

      printf("%-18s  %s\n", alias, comment)
    }' | fzf --reverse)

  if [ -z "${selected}" ]; then
    return 1
  fi
  echo -n "${selected}" | awk '{ print $1 }' | tr -d '\n' | xclip -i -selection clipboard
}

### .jira-my !!! my jira tasks {
.jira-my() {
  jira issue list -a$(jira me)
}

.jira-my-open() {
  jira issue list -a$(jira me) -s "Open"
}

.jira-my-review() {
  jira issue list -a$(jira me) -s "Review"
}
