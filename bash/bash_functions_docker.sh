select_docker_containter_and_invoke_command() {
  local branches branch
  items=$(eval "docker ps $1" | sed '1d') 
  item=$(echo "$items" | fzf --nth=2)
  item=$(echo $item | awk '{print $1}')
  eval "docker $2 $item $3"
} 

# remove docker container
fd_remove() {
  select_docker_containter_and_invoke_command "-a" "rm -f"
  echo "container $branchId removed"
}

# bash exec docker container
fd_exec() {
  select_docker_containter_and_invoke_command "" "exec -it" "bash"
}

# bash restart docker container
fd_restart() {
  select_docker_containter_and_invoke_command "" "restart -t 0" ""
}

# bash exec docker container as root
fd_exec_root() {
  local branches branch
  select_docker_containter_and_invoke_command "" "exec -u 0 -it" "bash"
}

# bash log docker container
fd_log() {
  select_docker_containter_and_invoke_command "-a" "logs -f" ""
}

# start docker container
fd_start() {
  select_docker_containter_and_invoke_command "-a --filter \"status=exited\"" "start" ""
}

# stop docker container
fd_stop() {
  select_docker_containter_and_invoke_command "" "stop" ""
}

# docker compose up service
fdc_up() {
  services="$(ls -l | grep -e "^d" | grep -v logs | awk '{print $9}')"
  item=$(echo "$services" | fzf)
  docker-compose up -d $item
}

# docker compose build service
fdc_build() {
  services="$(ls -l | grep -e "^d" | grep -v logs | awk '{print $9}')"
  item=$(echo "$services" | fzf)
  docker-compose build $item
}
