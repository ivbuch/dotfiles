function t_ru() {
  translate :ru $1 | less
}

function t_en() {
  translate ru:en $1 | less
}

function t_() {
  translate $1 | less
}

function kill_java_process_by_keyword() {
  local pid=$(ps -ef | grep identity-server | grep -v grep | grep java | awk '{print $2}')
  if [ ! -z "$pid" ]; 
  then
    echo "kill running app, pid $pid"
    kill -9 $pid
  fi  
}
