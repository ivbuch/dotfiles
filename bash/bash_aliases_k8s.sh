alias k="kubectl"
alias m="minikube"

alias .k8_igor_pod_create="kubectl run igor-network-utils --image=amouat/network-utils  ping 1.1.1.1"
alias .k8_igor_pod="kubectl exec -it igor-network-utils -- bash"
