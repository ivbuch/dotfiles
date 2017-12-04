export EDITOR="vim"
export PAGER="less"

HI="/my-tools/home-infostructure"
export PATH=$PATH:$HI/python-scripts/docker
export PATH=$PATH:$HI/python-scripts/svn
export PATH=$PATH:$HI/python-scripts/tmux
export PATH=$PATH:$HI/python-scripts/git
export PATH=$PATH:$HI/python-scripts/i3
export PATH=$PATH:$HI/bash-scripts/work
export PATH=$PATH:/opt/translate-script

source ~/.bash_aliases
source /my-tools/dotfiles/bash/bash_functions.sh
source $HOME/.config/virtual-envs/main/bin/activate
