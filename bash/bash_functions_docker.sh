select_service_and_invoke_command() {
  services="$(ls -l | grep -e "^d" | grep -v logs | awk '{print $9}')"
  item=$(echo "$services" | fzf --reverse --tac)
  if [[ "$?" -eq "0" ]]; then
    echo "Execute: dc $1 $item"
    eval "docker-compose $1 $item"
    echo "Done"
  fi
} 

select_docker_containter_and_invoke_command() {
  items=$(eval "docker ps $1" | sed '1d') 
  item=$(echo "$items" | fzf --reverse --nth=2 --tac)
  if [[ "$?" -eq "0" ]]; then
    item=$(echo $item | awk '{print $1}')
    echo "Execute: d $2 $item $3"
    eval "docker $2 $item $3"
    echo "Done"
  fi
} 

# remove docker container
fd_remove() {
  select_docker_containter_and_invoke_command "-a" "rm -f"
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
  select_docker_containter_and_invoke_command "" "exec -u 0 -it" "bash"
}

# bash log docker container
fd_log() {
  select_docker_containter_and_invoke_command "-a" "logs -f" ""
}

# bash inspect docker container
fd_inspect() {
  select_docker_containter_and_invoke_command "-a" "inspect" ""
}

# bash copy docker container name
fd_copy_container_name() {
  item=$(docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Image}}' | sed '1d' | fzf --tac)
  if [[ "$?" -eq "0" ]]; then
    name=$(echo $item | awk '{print $1}')
    echo -n $name | xclip -selection clipboard
    echo "Name $name copied to clipboard"
  fi
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
  select_service_and_invoke_command "up -d"
}

# docker compose up service
fdc_remove_rebuild_up() {
  select_service_and_invoke_command "up -d --build --force-recreate"
}

# docker compose start service
fdc_start() {
  select_service_and_invoke_command "start"
}

# docker compose build service
fdc_build() {
  select_service_and_invoke_command "build"
}
