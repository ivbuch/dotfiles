export EDITOR="vim"
export PAGER="less"
export ORACLE_PATH="/my-tools/dotfiles/sqlplus"
export SPRING_HOME="/opt/spring-boot/actual"
export DISABLE_AUTO_TITLE="true"
export DOT_FILES="/my-tools/dotfiles"
export HOME_INFOSTRUCTURE="/my-tools/home-infostructure"

# makes less search case insensitive
export LESS="-i -R"

export PATH=$PATH:$HOME_INFOSTRUCTURE/python-scripts/docker
export PATH=$PATH:$HOME_INFOSTRUCTURE/python-scripts/svn
export PATH=$PATH:$HOME_INFOSTRUCTURE/python-scripts/tmux
export PATH=$PATH:$HOME_INFOSTRUCTURE/python-scripts/git
export PATH=$PATH:$HOME_INFOSTRUCTURE/python-scripts/i3
export PATH=$PATH:$HOME_INFOSTRUCTURE/bash-scripts/work
export PATH=$PATH:/opt/translate-script
export PATH=$PATH:$SPRING_HOME/bin
export PATH="$HOME/.bin:$PATH"

source ~/.bash_aliases
source $DOT_FILES/bash/bash_functions.sh
source $HOME/.config/virtual-envs/main/bin/activate
source $HOME_INFOSTRUCTURE/work/medfusion/export-ports.sh

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences
