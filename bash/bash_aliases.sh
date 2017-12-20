alias weather="curl wttr.in"
alias tma="/my-tools/home-infostructure/python-scripts/tmux/tmux-attach-session.py"
alias tx="tmuxp load -2"
alias txl="ls ~/.tmuxp/"
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias r='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias ja='. jira-accident-folder.sh'

alias l="ls -lh"
alias lt="ls -lht"
alias la="ls -laht"
alias lh="ls -lht | head"

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
alias cdd="cd /my-tools/dotfiles"
alias cdh="cd /my-tools/home-infostructure"
alias cda="cd /my-tools/ansible"
alias cdap="cd /my-tools/ansible/playbooks"
alias cdw="cd ~/ideaProjects"

# init dotfiles
alias init_dotfiles="cd /my-tools/dotfiles/ansible && ansible-playbook init-dotfiles.yml --ask-sudo-pass"

# source version control
alias gur="git-update-repositories.py"
alias gd='git difftool'
alias gs='git status'
alias gite="/my-tools/home-infostructure/python-scripts/git/git-editor.py"
alias ggraph="git log --oneline --graph --decorate"
alias gl="git log --name-status"
alias gb="git branch"
alias gc="git checkout"

alias svns="svn status | grep -v -E '^Performing' | grep -v -E '^X.*'  | grep -v -E '^$'"
alias svnd="svn diff"
alias svnl="svn up && svn log -l 200 -v | less"

# URL encode/decode
alias url_encode='python -c "import sys; import urllib.parse; print(urllib.parse.quote(sys.argv[1]))"'
alias url_decode='python -c "import sys; import urllib.parse; print(urllib.parse.unquote(sys.argv[1]))"'
