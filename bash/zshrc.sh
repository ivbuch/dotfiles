export EDITOR="vim"
export PAGER="less"
export ORACLE_PATH="/my-tools/dotfiles/sqlplus"
export SPRING_HOME="/opt/spring-boot/actual"
export DISABLE_AUTO_TITLE="true"

# makes less search case insensitive
export LESS="-i -R"

HI="/my-tools/home-infostructure"
export PATH=$PATH:$HI/python-scripts/docker
export PATH=$PATH:$HI/python-scripts/svn
export PATH=$PATH:$HI/python-scripts/tmux
export PATH=$PATH:$HI/python-scripts/git
export PATH=$PATH:$HI/python-scripts/i3
export PATH=$PATH:$HI/bash-scripts/work
export PATH=$PATH:/opt/translate-script
export PATH=$PATH:$SPRING_HOME/bin
export PATH="$HOME/.bin:$PATH"

source ~/.bash_aliases
source /my-tools/dotfiles/bash/bash_functions.sh
source $HOME/.config/virtual-envs/main/bin/activate
source /my-tools/home-infostructure/work/medfusion/export-ports.sh
