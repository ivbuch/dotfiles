export EDITOR="vim"
export PAGER="less"
export BROWSER="qutebrowser"
export KAFKA_HOME="/opt/kafka"

export ORACLE_PATH="/my-tools/dotfiles/sqlplus"
export SPRING_HOME="/opt/spring-boot/actual"
export DISABLE_AUTO_TITLE="true"
export DOT_FILES="/my-tools/dotfiles"
export HOME_INFOSTRUCTURE="/my-tools/home-infostructure"
export SPARK_HOME="/opt/apache-spark/actual"

# for karma test runner
export "CHROME_BIN=$(which chromium)"

# makes less search case insensitive
export LESS="-i -R"

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin/exec-scripts:$PATH"
export PATH="$HOME/.bin/exec-scripts-dotfiles:$PATH"
export PATH="$HOME/.config/virtual-envs/main/bin:$PATH"
export PATH="/opt/selenium-drivers/gecko/active:$PATH"
export PATH="/opt/selenium-drivers/chrome/active:$PATH"
export PATH="/opt/dbeaver/actual:$PATH"
export PATH="/opt/jdk/bin:$PATH"
export PATH="$PATH:$HOME_INFOSTRUCTURE/python-scripts/docker"
export PATH="$PATH:$HOME_INFOSTRUCTURE/python-scripts/svn"
export PATH="$PATH:$HOME_INFOSTRUCTURE/python-scripts/tmux"
export PATH="$PATH:$HOME_INFOSTRUCTURE/python-scripts/git"
export PATH="$PATH:$HOME_INFOSTRUCTURE/python-scripts/i3"
export PATH="$PATH:$HOME_INFOSTRUCTURE/bash-scripts/work"
export PATH="$PATH:/opt/translate-script"
export PATH="$PATH:$SPRING_HOME/bin"
export PATH="$PATH:$SPARK_HOME/bin"

# GOLANG PATh
export GOPATH="$HOME/workspace/go"
