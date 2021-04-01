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
  items=$(eval "docker ps --format \"table {{.Names}}\\t{{.Image}}\\t{{.Status}}\" $1" | sed '1d') 
  items=$(echo "$items" | fzf -e --reverse --nth=1 --tac --multi)
  if [[ "$?" -eq "0" ]]; then
    items=$(echo $items | awk '{print $1}')
    lines="$(echo $items | wc -l)"
    if [[ "$lines" -eq "1" ]]; then
      echo "Execute: docker $2 $items $3"
      eval "docker $2 $items $3"
    else  
      while read -r item; do
	echo "Execute: docker $2 $item $3"
	eval "docker $2 $item $3"
      done <<< "$items"
    fi
    echo "Done"
  fi
}

# remove docker container
fdrm() {
  select_docker_containter_and_invoke_command "" "rm -f"
}

fdrma() {
  select_docker_containter_and_invoke_command "-a" "rm -f"
}

# bash exec docker container
fde() {
  select_docker_containter_and_invoke_command "" "exec -it -e 'TERM=xterm-256color'" "bash"
}

# sh exec docker container
fdes() {
  select_docker_containter_and_invoke_command "" "exec -it" "sh"
}

# bash restart docker container
fdr() {
  select_docker_containter_and_invoke_command "" "restart -t 0" ""
}

# bash exec docker container as root
fd_exec_root() {
  select_docker_containter_and_invoke_command "" "exec -u 0 -it" "bash"
}

# bash log docker container
fdl() {
  select_docker_containter_and_invoke_command "" "logs -f --tail 200" ""
}
fdla() {
  select_docker_containter_and_invoke_command "-a" "logs -f --tail 200" ""
}

# bash inspect docker container
fdi() {
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
fds() {
  select_docker_containter_and_invoke_command "-a --filter \"status=exited\"" "start" ""
}

# stop docker container
fdst() {
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
