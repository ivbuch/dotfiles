alias m="man"
alias piy="ping ya.ru"
alias gs="echo type git s please"
alias weather="curl wttr.in"
alias tma='$HOME_INFOSTRUCTURE/python-scripts/tmux/tmux-attach-session.py'
alias tx="tmuxp load -2"
alias txl="ls ~/.tmuxp/"
alias r='ranger --choosedir=/tmp/ranger-$USER-rangerdir; LASTDIR=`cat /tmp/ranger-$USER-rangerdir`; cd "$LASTDIR"'
alias ja='. jira-accident-folder.sh'
alias die="kill -9"
alias bash_check="shellcheck"
alias music="ncmpcpp"
alias i3_tree="i3-msg -t get_tree | jq '.'  | vim - -c 'set filetype=json'"
alias f="find ."
alias calendar="cal"
alias ta="task"
alias du1="du -h -d1"
alias j="jrnl"

alias jv="jira view"

alias l="ls -lh --classify"
alias lt="ls -lh --classify --sort=time"
alias la="ls -lah --classify --sort=time"
alias lh="ls -lh --classify --sort=time | head"

alias g="git"
alias gr="grep  --color=always --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias grep="grep --color=always --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias grep_="grep --color=never --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias p="vim"
alias e="exit"
alias q="exit"
alias _="sudo"
alias _e="sudo -e"
alias t="less +F"
alias v="vim"
alias psg="ps -ef | grep"
alias clipboard_from="xclip -o -selection clipboard"
alias clipboard_to="xclip -i -selection clipboard"
alias pwdc="pwd | tr -d '[:space:]' | xclip -selection clipboard && echo pwd copied to clipboard"
alias rm="rm -v -r"
alias mv="mv -v"
alias cp="cp -v -r"
alias chmod="chmod -v"
alias rsync="rsync -v"
alias mkdir="mkdir -v -p"
alias reload_xresources="xrdb ~/.Xresources"
alias apt="sudo apt"
alias apti="sudo apt install"
alias reddit="rtv"
alias red="rtv"
alias font_viewer="gtk2fontsel"

alias u="cd .."
alias cdd='cd $DOT_FILES'
alias cdh='cd $HOME_INFOSTRUCTURE'
alias cda="cd /my-tools/ansible"
alias cdap="cd /my-tools/ansible/playbooks"
alias cdw="cd ~/workspace"
alias cdm="cd ~/Music"
alias cdD="cd ~/Downloads"
alias cdpw='cd $HOME/Pictures/wallpapers'
alias cdps='cd $HOME/Pictures/screenshots'
alias cdmfd='cd $HOME_INFOSTRUCTURE/work/medfusion/mf-apps'
alias cdmfs='cd $HOME/workspace/mfss'
alias cdmfr='cd $HOME_INFOSTRUCTURE/work/medfusion/rest/rest-client'
alias cdmft='cd $HOME_INFOSTRUCTURE/work/medfusion/scripts/integration-test-client'
alias cdmfk='cd $HOME_INFOSTRUCTURE/work/medfusion/kafka'


# init dotfiles
alias init_dotfiles='cd $DOT_FILES/ansible && ansible-playbook init-dotfiles.yml --ask-become-pass'
alias init_arch_linux="cd $DOT_FILES/ansible && ansible-playbook arch-linux.yml --ask-become-pass"

# SVN
alias svns="svn status | grep -v -E '^Performing' | grep -v -E '^X.*'  | grep -v -E '^$'"
alias svnd="svn diff"
alias svnl="svn up && svn log -l 200 -v | less"

# URL encode/decode
alias url_encode='python -c "import sys; import urllib.parse; print(urllib.parse.quote(sys.argv[1]))"'
alias url_decode='python -c "import sys; import urllib.parse; print(urllib.parse.unquote(sys.argv[1]))"'

# Docker
alias d="docker"
alias dc="docker-compose"
alias dps="docker ps --format 'table {{.Image}}\t{{.Status}}\t{{.Ports}}'"

# PACMAN
alias pmu="sudo pacman -Syu"
alias pms="pacman -Ss"
alias pmi="sudo pacman -S"
alias pmrm="sudo pacman -Rs"
alias pacman_package_files="sudo pacman -Q -l" # next goes package name
alias pacman_download="sudo pacman -Syuw" # downloads packages to install
alias pacman_cleanup_cach="sudo paccache -ruk0" # removes pacman cached packages

# NETWORK
alias ports='netstat -tulanp'

# MAVEN
alias mvn_p='mvn clean package'
alias mvn_i='mvn clean install'
alias mvn_pst='mvn clean package -DskipTests=true'
alias mvn_t='mvn clean test'
alias mvn_test_debug='mvn clean test -Dmaven.surefire.debug test'
alias mvn_ist='mvn clean install -DskipTests=true'
alias mvn_dep='mvn dependency:tree -Dverbose  | less'
alias mvn_ep='mvn help:effective-pom'

# SOUND
alias soundctl="pavucontrol"

# DISPLAY
alias displayctl="arandr"

# SYSTEMD
alias sd="systemctl"
alias sdu="systemctl --user"

# WORK
alias rc='python $HOME_INFOSTRUCTURE/work/medfusion/rest/rest-client/main.py' 

# KARMA
alias js_karma="node_modules/karma/bin/karma start karma.conf.js"

# PYTHON
alias pytest_ipdb="pytest -s --pdb --pdbcls=IPython.terminal.debugger:Pdb"

# KUBERNETES
alias kc="microk8s.kubectl"
alias kd="microk8s.docker"

# BUKU
alias b="buku"

# TORRENT
alias torrent_start="systemctl restart transmission.service && chromium http://localhost:9091"
 
# task warrior gui
alias tw="firefox http://localhost:5678"

# yaml
alias yaml_validate="python -c 'import yaml, sys; print(yaml.safe_load(sys.stdin))'"
