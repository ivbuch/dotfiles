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
