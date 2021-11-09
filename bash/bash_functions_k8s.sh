.k8_open_system_test() {
  address=$(kubectl get nodes -l kubernetes.io/role=node --no-headers -o json | jq '.items[] | select(.metadata.labels | contains({"kubernetes.io/role": "node"})) | .status.addresses[] | select(.type == "ExternalIP") | .address' --raw-output)
  firefox $address:30011/api/mds-static/tree.html
}

.k8_kafkacat() {
   kubectl run kafkacat --image edenhill/kafkacat:1.6.0 --restart=Never --command -- sleep 1000000
}

.k8_kafkacat() {
  topic=${1:-streamsnap-incoming}
  offset=${2:-end}
  echo Consuming topic $topic
  kubectl exec -it kafkacat -- kafkacat -C -t $topic -o $offset -f '%t\n%p\n%o\n%R%s\n\n\n\n\n' -b z-kafka:9092 
}

.k8_pod_by_label() {
  if [ -z "$1" ]; then
    echo "Provide label selector like 'app=test'"
    return 1
  fi

  kubectl get pods --selector "$1" --output json --field-selector=status.phase=Running | jq ".items[0].metadata.name" --raw-output
}


.k8_goutils() {
  # pod_name="igor-go-utilss"
  pod_name="igor-go-utils"
  run_pod="kubectl run igor-go-utils --image=ivbuch/go-utils:0.4 --image-pull-policy=Always"
  if kubectl get pods ${pod_name}; then 
    echo "Recreate pod?[no]"
    read recreate
    recreate_pod=${recreate:-no}
    if [ "${recreate_pod}" = "yes" ]; then
      kubectl delete pod ${pod_name}
      eval ${run_pod}
      sleep 5
    fi
  else
    eval ${run_pod}
    sleep 5
  fi
  kubectl exec -it ${pod_name} -- bash
}

.kp() {
  # copy pod in default namespace
  pod=$(kubectl get pods | fzf --exact --header-lines=1 --nth=1 --header-lines 1 \
    --preview-window follow \
    --preview "kubectl logs '{1}' --since=5m" \
    --bind 'ctrl-l:preview(echo {})')
  if [ -z "${pod}" ]; then
    return 1
  fi

  echo -n "${pod}" | awk '
  {
    ORS = ""
    pod_name = $1
    print pod_name
  }' | xclip -selection clipboard
}

.kpa() {
  # copy pod across all namespaces
  pod=$(kubectl get pods -A | fzf --exact --header-lines=1 --nth=2 --header-lines 1 \
    --preview-window follow \
    --preview "kubectl logs --namespace '{1}' '{2}' --since=5m" \
    --bind 'ctrl-l:preview(echo {})')
  if [ -z "${pod}" ]; then
    return 1
  fi

  echo -n "${pod}" | awk '
  {
    ORS = ""
    namespace = $1
    pod_name = $2
    print "--namespace", namespace, pod_name
  }' | xclip -selection clipboard
}

.kp_copy() {
  if ! ..get_namespace_pod_container_name; then
    return 1
  fi

  # files=$(eval kubectl exec "${container_param}" "${namespace_param}" "${pod_name}" -- find '/tmp' ! -ipath '/proc' ! -ipath '/usr' ! -ipath '/sys' ! -ipath '/root' ! -ipath '/dev' ! -ipath '/var/lib')
  files=$(eval kubectl exec "${container_param}" "${namespace_param}" "${pod_name}" -- find '/tmp')
  if [ -z "${files}" ]; then
    return 1
  fi
  selected_file=$(echo ${files} | fzf --exact)
  if [ -z "${selected_file}" ]; then
    return 1
  fi
  echo Executing kubectl cp --namespace "${namespace}" "${pod_name}":"${selected_file}" "${output_file}"
  eval kubectl cp "${container_param}" "${namespace_param}" "${pod_name}":"${selected_file}" .
}

.k8_network_utils() {
  pod_name="igor-network-utils"

  pods=$(kubectl get pods --field-selector=metadata.name=${pod_name},status.phase=Running --output json  | jq --raw-output '.items | length')

  if [ "${pods}" = "1" ]; then
    echo "Hooray! ${pod_name} is already UP"
  else 
    echo "Running ${pod_name}"
    kubectl run "${pod_name}" --image=ivbuch/igor-network-utils:0.1 --image-pull-policy=Always
    sleep 2

    max_iterations=50
    wait_seconds=2
    iterations=1
    while true
    do
      pods=$(kubectl get pods --field-selector=metadata.name=${pod_name},status.phase=Running --output json  | jq --raw-output '.items | length')

      if [ "${pods}" = "1" ]; then
	echo "Hooray! ${pod_name} is UP"
	break
      fi

      if [ "${iterations}" -ge "${max_iterations}" ]; then
	echo "${pod_name}  didn't start up"
	return 1
      fi
      iterations=$((iterations + 1))
      echo "Attempt ${iterations} of ${max_iterations}"
      echo "Sleeping ${wait_seconds} seconds..."
      sleep ${wait_seconds}
    done
  fi

  kubectl exec -it ${pod_name} -- bash
}

..get_namespace_pod_container_name() {

  if [[ "${showAllPods}" == "yes" ]]; then
    pod_line=$(kubectl get pods -A | fzf --exact --header-lines=1 --header-lines 1)
  else
    pod_line=$(kubectl get pods | fzf --exact --header-lines=1 --header-lines 1)
  fi

  if [ -z "${pod_line}" ]; then
    return 1
  fi
  if [[ "${showAllPods}" == "yes" ]]; then
    pod_name=$(echo -n "${pod_line}" | awk '
    {
      ORS = ""
      namespace = $1
      pod_name = $2
      print pod_name
    }')
    namespace=$(echo -n "${pod_line}" | awk '
    {
      ORS = ""
      namespace = $1
      print namespace
    }')
    namespace_param="--namespace ${namespace}"
else
    pod_name=$(echo -n "${pod_line}" | awk '
    {
      ORS = ""
      pod_name = $1
      print pod_name
    }')
    namespace_param=""
    echo podddd ${pod_name}
  fi

  container=""

  containers=$(kubectl get pod "${pod_name}" -o json | jq '.spec.containers | length' --raw-output)

  if [[ ${containers} -gt 1 ]]; then
    case "${pod_name}" in
      sysdigcloud-collector*) container="collector";;
      *worker*) container="worker";;
      sysdigcloud-api*) container="api";;
      *) container="";;
    esac
  fi

  container_param=""
  if [ -n "${container}" ]; then
    container_param="--container ${container}"
  fi
}

.kp_get_config() {
  if [ -z "$1" ]; then
    echo "Provide destination file"
    return 1
  fi
  port="${2:-9001}"
  if [ -z "$1" ]; then
    echo "Provide destination file"
    return 1
  fi

  if ! ..get_namespace_pod_container_name; then
    return 1
  fi
  echo eval kubectl exec -it "${container_param}" "${namespace_param}"  "${pod_name}" -- $@
  output=$(mktemp)
  echo kubectl exec -it "${container_param}" "${namespace_param}" "${pod_name}" -- curl localhost:${port}/actuator/info 1>"${output}"
  eval kubectl exec -it "${container_param}" "${namespace_param}" "${pod_name}" -- curl localhost:${port}/actuator/info 1>"${output}"
  output_formatted=$(mktemp)
  cat ${output} | jq .config > ${1}
}

.kp_exec() {
  if ! ..get_namespace_pod_container_name; then
    return 1
  fi
  echo eval kubectl exec -it "${container_param}" "${namespace_param}"  "${pod_name}" -- $@
  eval kubectl exec -it "${container_param}" "${namespace_param}" "${pod_name}" -- $@
}

.kp_execA() {
  showAllPods=yes
  .kp_exec "$@"
}


.kp_logs() {
  if ! ..get_namespace_pod_container_name; then
    return 1
  fi
  echo eval kubectl logs "${container_param}" "${namespace_param}" "${pod_name}" $@
  eval kubectl logs "${container_param}" "${namespace_param}" "${pod_name}" $@
}

.kp_logsA() {
  showAllPods=yes
  .kp_logs "$@"
}

.kp_events() {
    {
        echo $'TIME\tNAMESPACE\tTYPE\tREASON\tOBJECT\tSOURCE\tMESSAGE';
        kubectl get events -o json "$@" \
            | jq -r  '.items | map(. + {t: (.eventTime//.lastTimestamp)}) | sort_by(.t)[] | [.t, .metadata.namespace, .type, .reason, .involvedObject.kind + "/" + .involvedObject.name, .source.component + "," + (.source.host//"-"), .message] | @tsv';
    } \
        | column -s $'\t' -t \
        | less -S
}

### .kp_get_pods_running_to_a_pod !!! show pods on a node where given pod is running
.kp_get_pods_running_to_a_pod() {
  node=$(kubectl get pods -o json "${1}" | jq '.status.hostIP' --raw-output)
  if [ -z "${node}" ]; then
    echo "no node"
    return 1
  fi
  kubectl get pod --field-selector="spec.nodeName=${node}"
}
