alias weather="curl wttr.in"
alias tma="$HOME_INFOSTRUCTURE/python-scripts/tmux/tmux-attach-session.py"
alias tx="tmuxp load -2"
alias txl="ls ~/.tmuxp/"
alias r='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias ja='. jira-accident-folder.sh'

alias l="ls -lh"
alias lt="ls -lht"
alias la="ls -laht"
alias lh="ls -lht | head"

alias g="grep"
alias p="less"
alias e="exit"
alias _="sudo"
alias t="tail -f"
alias v="vim"
alias psg="ps -ef | grep"
alias clipboard_from="xclip -o -selection clipboard"
alias clipboard_to="xclip -i -selection clipboard"
alias pwdc="pwd | xclip -selection clipboard"
alias rm="rm -v"
alias mv="mv -v"
alias cp="cp -v"
alias chmod="chmod -v"
alias rsync="rsync -v"
alias mkdir="mkdir -v"
alias reload_xresources="xrdb ~/.Xresources"
alias apt="sudo apt"
alias apti="sudo apt install"

# open & xdg-open
if [[ $(uname -a) == *"Linux"* ]]; then
  alias o="nohup xdg-open"
else
  alias o="open"  
fi

alias u="cd .."
alias cdd="cd $DOT_FILES"
alias cdh="cd $HOME_INFOSTRUCTURE"
alias cda="cd /my-tools/ansible"
alias cdap="cd /my-tools/ansible/playbooks"
alias cdw="cd ~/workspace"
alias cdmfd="cd $HOME_INFOSTRUCTURE/work/medfusion/mf-docker"
alias cdmfs="cd $HOME/workspace/mfss"

# init dotfiles
alias init_dotfiles="cd $DOT_FILES/ansible && ansible-playbook init-dotfiles.yml --ask-sudo-pass"
alias init_arch_linux="cd $DOT_FILES/ansible && ansible-playbook arch-linux.yml --ask-sudo-pass"

# GIT
alias gur="git-update-repositories.py"
alias gd='git difftool'
alias gdm='git difftool --tool=meld'
alias gs='git status'
alias gite="/my-tools/home-infostructure/python-scripts/git/git-editor.py"
alias ggraph="git log --oneline --graph --decorate"
alias gl="git log --name-status --abbrev-commit"
alias gb="git branch -vv"
alias gc="git checkout"
alias gC="git commit -m"
alias gf="git fetch"

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
alias pacsu="sudo pacman -Syu"
alias pacman_package_files="pacman -Q -l" # next goes package name
