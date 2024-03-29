source "$DOT_FILES/bash/bash_aliases_docker.sh"
source "$DOT_FILES/bash/bash_aliases_k8s.sh"
source "$DOT_FILES/bash/bash_aliases_gradle.sh"
source "$DOT_FILES/bash/bash_aliases_git.sh"

alias .find="fd"
alias piy="ping ya.ru"
alias weather="curl wttr.in"
alias tma='$HOME_INFRA/python-scripts/tmux/tmux-attach-session.py'
alias tx="tmuxp load -2"
alias txl="ls ~/.tmuxp/"
alias r='ranger --choosedir=/tmp/ranger-$USER-rangerdir; LASTDIR=`cat /tmp/ranger-$USER-rangerdir`; cd "$LASTDIR"'
alias music="ncmpcpp"
alias f="find ."
alias fg="find . | grep"
alias calendar="cal"
alias ta="task"
alias du1="du -h -d1"

alias l="ls -lh --classify"
alias lt="ls -lh --classify --sort=time"
alias la="ls -lah --classify --sort=time"
alias lh="ls -lh --classify --sort=time | head"

alias grep="grep --color=always --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias grep_="grep --color=never --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

alias e="exit"
alias t="less +F"
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
alias reddit="rtv"
alias red="rtv"
alias font_viewer="gtk2fontsel"
alias .wacom="/my-tools/dotfiles/wacom-tablet/map-to-output.sh"

alias cdd='cd $DOT_FILES'
alias cdh='cd $HOME_INFRA'
alias cdw="cd ~/workspace"
alias cdm="cd /run/media/igor/"
alias cdD="cd ~/downloads"
alias cdp='cd $HOME/pictures'
alias cdps='cd $HOME/pictures/screenshots'
alias cdti='cd /tmp/igor'

alias cdmfd='cd $HOME_INFRA/work/medfusion/mf-apps'
alias cdmfs='cd $HOME/workspace/mfss'
alias cdmft='cd $HOME_INFRA/work/medfusion/scripts/integration-test-client'


# init dotfiles
alias init_dotfiles='cd $DOT_FILES/ansible && ansible-playbook init-dotfiles.yml --ask-become-pass'
alias init_arch_linux="cd $DOT_FILES/ansible && ansible-playbook arch-linux.yml --ask-become-pass"

# URL encode/decode
alias url_encode='python -c "import sys; import urllib.parse; print(urllib.parse.quote(sys.argv[1]))"'
alias url_decode='python -c "import sys; import urllib.parse; print(urllib.parse.unquote(sys.argv[1]))"'

# PACMAN
alias .pacman_update="sudo pacman -Syu"
alias .pacman_search="pacman -Ss"
alias .pacman_install="sudo pacman -S"
alias .pacman_remove="sudo pacman -Rs"
alias .pacman_package_files="sudo pacman -Q -l" # next goes package name
alias .pacman_download="sudo pacman -Syuw" # downloads packages to install
alias .pacman_cleanup_cach="sudo paccache -ruk0" # removes pacman cached packages

# TRIZEN
alias .trizen_remove="trizen -Rs"
alias .trizen_search="trizen -Ss"
alias .trizen_install="trizen -S"
alias .trizen_update="trizen -Syua "

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
alias rc='python $HOME_INFRA/work/medfusion/rest/rest-client/main.py' 

# KARMA
alias js_karma="node_modules/karma/bin/karma start karma.conf.js"

# PYTHON
alias pytest_ipdb="pytest -s --pdb --pdbcls=IPython.terminal.debugger:Pdb"

# TORRENT
alias torrent_start="systemctl restart transmission.service && chromium http://localhost:9091"
 
# task warrior gui
alias tw="firefox http://localhost:5678"

# yaml
alias yaml_validate="python -c 'import yaml, sys; print(yaml.safe_load(sys.stdin))'"

# remember the milk
alias rtm_t="rtm lsp status:incompleme list:today"
alias rtm_w="rtm lsp status:incompleme list:week"
alias rtm_m="rtm lsp status:incompleme list:month"

alias gl="glow README.md"

alias .agent_rest="curl http://localhost:24482/api/protobuf/metrics | jq . -C | less"
alias .agent_rest_prom_metrics="curl http://localhost:24482/api/protobuf/metrics -s | jq . | grep igor_prom | wc -l"

alias .java_remove_jitdumps="find . -name 'jitdump.20*' -or  -name 'javacore.20*' -or -name 'Snap.20*' -or -name 'heapdump.2*' | xargs -I {} rm {} -v"

# antlr
alias .antlr_generate='java -cp /opt/antlr/antlr-4.9.1-complete.jar:. org.antlr.v4.Tool' # add g4 file
alias .antlr_compile='javac -cp .:/opt/antlr/antlr-4.9.1-complete.jar ' # add asdasd*.java
alias .antlr_test='java -cp /opt/antlr/antlr-4.9.1-complete.jar:. org.antlr.v4.gui.TestRig' # add Hello r

# arduino
alias a="arduino-cli"
alias ac="arduino-cli compile --fqbn arduino:avr:mega"
alias au="arduino-cli upload --fqbn arduino:avr:mega -p /dev/ttyACM0"
