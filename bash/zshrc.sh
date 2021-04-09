source "$HOME/.bash_aliases"
source "$DOT_FILES/bash/bash_functions.sh"


VIRTUAL_ENV_DISABLE_PROMPT=1 source $HOME/.config/virtual-envs/main/bin/activate
source "$HOME_INFOSTRUCTURE/bash-scripts/z.sh"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -z "$TMUX" ] && tmux


# zle -N ssh_connect fdr
# bindkey "^s" ssh_connect

eval "$(direnv hook zsh)"

source <(kubectl completion zsh)
complete -F __start_kubectl k
complete -C '/usr/local/bin/aws_completer' aws
complete -C cmon-completer cmon
jenkins-cli completion zsh > "${fpath[1]}/_jenkins-cli"
i-kafka-consumer completion zsh > "${fpath[1]}/_i-kafka-consumer"
i-protobuf-decoder completion zsh > "${fpath[1]}/_i-protobuf-decoder"
