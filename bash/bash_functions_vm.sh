# list vms
alias .vm_list="VBoxManage list vms"
alias .vm_running="VBoxManage list runningvms | awk '{print $1 }' | tr -d '\"'"

# cd with fzf
.vm_start() {
  vms=$(VBoxManage list vms | awk '{print $1 }' | tr -d '"')
  running=$(VBoxManage list runningvms | awk '{print $1 }' | tr -d '"' | tr "\n" " ")

  if [ -n "$running" ]; then
    for running_vm in $(echo "$running"); do
      vms=$(echo "$vms" | sed "/$running_vm/d")
    done
  fi

  local sep="------"
  vms_list=""
  for vm in $(echo "$vms"); do
    vms_list="$vms_list\n$vm\n$vm"
    vms_list="$vms_list${sep}HEADLESS"
  done

  vm=$(echo "$vms_list" | fzf -e)
  if [ $? -ne 0 ]; then
    echo "Bad select"
    return 1
  fi

  headless=$(echo "$vm" | awk -F "$sep" '{print $2}')
  vm=$(echo "$vm" | awk -F "$sep" '{print $1}')

  start_type="gui"
  if [ -n "$headless" ]; then
    start_type='headless'
    echo Starting in headless mode $vm
  else
    echo Starting in NO headless mode $vm
  fi
    
  VBoxManage startvm "$vm" --type $start_type
}

.vm_stop() {
  vms=$(VBoxManage list runningvms | awk '{print $1 }' | tr -d '"')

  if [ -z "$vms" ]; then
    echo nothing is running
    return 1
  fi

  vm=$(echo "$vms" | fzf -e)
  if [ $? -ne 0 ]; then
    echo "Bad select"
    return 1
  fi

  echo Saving state $vm
  echo VBoxManage controlvm $vm savestate
  VBoxManage controlvm $vm savestate
}
