export EDITOR="vim"
export PAGER="less"
export BROWSER="firefox"
export KAFKA_HOME="/opt/kafka"

export ORACLE_PATH="/my-tools/dotfiles/sqlplus"
export SPRING_HOME="/opt/spring-boot/actual"
export DISABLE_AUTO_TITLE="true"
export DOT_FILES="/my-tools/dotfiles"
export HOME_INFRA="/my-tools/home-infra"
export SPARK_HOME="/opt/apache-spark/actual"
export GOPATH="$HOME/workspace/go"
export CASSANDRA_HOME="/opt/cassandra/active"
export KAFKA_HOME="/opt/kafka/active"

# makes less search case insensitive
export LESS="-i -R"

export PATH="$HOME/.bin/go-scripts:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin/exec-scripts:$PATH"
export PATH="$HOME/.bin/exec-scripts-dotfiles:$PATH"
export PATH="$HOME/.config/virtual-envs/main/bin:$PATH"
export PATH="/opt/selenium-drivers/gecko/active:$PATH"
export PATH="/opt/selenium-drivers/chrome/active:$PATH"
export PATH="/opt/dbeaver/actual:$PATH"
export PATH="/opt/jdk/bin:$PATH"
export PATH="$PATH:$HOME_INFRA/python-scripts/docker"
export PATH="$PATH:$HOME_INFRA/python-scripts/svn"
export PATH="$PATH:$HOME_INFRA/python-scripts/tmux"
export PATH="$PATH:$HOME_INFRA/python-scripts/git"
export PATH="$PATH:$HOME_INFRA/python-scripts/i3"
export PATH="$PATH:$HOME_INFRA/bash-scripts/work"
export PATH="$PATH:/opt/translate-script"
export PATH="$PATH:$SPRING_HOME/bin"
export PATH="$PATH:$SPARK_HOME/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$CASSANDRA_HOME/bin"
export PATH="${PATH}:${KAFKA_HOME}/bin"

if [ -d /opt/gcloud/google-cloud-sdk ]; then
  export PATH="${PATH}:/opt/gcloud/google-cloud-sdk/bin"
fi

if [ -d /usr/pgadmin4/bin ]; then
  export PATH="${PATH}:/usr/pgadmin4/bin"
fi

