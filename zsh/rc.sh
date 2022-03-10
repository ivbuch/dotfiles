SAVEHIST=5000
HISTSIZE=5000
HISTFILE=~/.zsh_history
setopt share_history

(cat ~/.cache/wal/sequences &)

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload bashcompinit
bashcompinit

bindkey -v

setopt auto_cd

# search with arrors up/down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

bindkey '^R' history-incremental-pattern-search-backward

source /my-tools/dotfiles/zsh/powerline.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "${HOME}/.bash_aliases"
source "${DOT_FILES}/bash/bash_functions.sh"

VIRTUAL_ENV_DISABLE_PROMPT=1 source $HOME/.config/virtual-envs/main/bin/activate
source "${HOME_INFRA}/bash-scripts/z.sh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -z "$TMUX" ] && tmux


# zle -N ssh_connect fdr
# bindkey "^s" ssh_connect

eval "$(direnv hook zsh)"

source <(kubectl completion zsh)

which helm 1>/dev/null 2>/dev/null && source <(helm completion zsh)

complete -F __start_kubectl k
complete -C '/usr/local/bin/aws_completer' aws
complete -C cmon-completer cmon

if [ "$(hostname)" = "igordesk" ]; then
  source /usr/local/ibmcloud/autocomplete/zsh_autocomplete
  # ~/.bin/go-scripts/jenkins-cli completion zsh > "${fpath[1]}/_jenkins-cli"
  # i-kafka-consumer completion zsh > "${fpath[1]}/_i-kafka-consumer"
  # i-protobuf-decoder completion zsh > "${fpath[1]}/_i-protobuf-decoder"
  # i-postgres-cli completion zsh > "${fpath[1]}/_i-postgres-cli"
fi

# PageDuty autocomplete
if where pd 1>/dev/null 2>/dev/null; then
  PD_AC_ZSH_SETUP_PATH=/home/igor/.cache/pagerduty-cli/autocomplete/zsh_setup && test -f $PD_AC_ZSH_SETUP_PATH && source $PD_AC_ZSH_SETUP_PATH; # pd autocomplete setup
fi


