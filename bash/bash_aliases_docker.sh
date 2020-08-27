alias d="docker"
alias dc="docker-compose"

alias dps="docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}' | sed '1d' | sort -k 1"
alias dpsa="docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Labels}}'"

alias .docker_run_igor_container="docker run --rm -d --name igor-network-utils ivbuch/igor-network-utils:0.1"
