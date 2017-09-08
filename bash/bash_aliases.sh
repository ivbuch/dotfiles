alias weather="curl wttr.in"
alias tma="/my-tools/home-infostructure/python-scripts/tmux/tmux-attach-session.py"
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias r='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias ja='. jira-accident-folder.sh'
alias l="ls -alht"
alias lh="ls -alht | head"
alias e="exit"
alias _="sudo"
alias t="tail -f"
alias v="vim"
alias psg="ps -ef | grep"
alias clipboard="xclip -selection clipboard"
alias pwdc="pwd | xclip -selection clipboard"

# open & xdg-open
if [[ $(uname -a) == *"Linux"* ]]; then
  alias o="nohup xdg-open"
else
  alias o="open"  
fi

alias cdd="cd /my-tools/dotfiles"
alias cdh="cd /my-tools/home-infostructure"
alias cda="cd /my-tools/ansible"
alias cdap="cd /my-tools/ansible/playbooks"
alias cdw="cd ~/ideaProjects"

# source version control
alias gur="git-update-repositories.py"
alias gd='git difftool'
alias gs='git status'
alias gite="/my-tools/home-infostructure/python-scripts/git/git-editor.py"
alias svns="svn status | grep -v -E '^Performing' | grep -v -E '^X.*'  | grep -v -E '^$'"
alias svnd="svn diff"
alias svnl="svn up && svn log -l 200 -v | less"

# URL encode/decode
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[2])"'
