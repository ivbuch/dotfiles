alias k="kubectl"
alias m="minikube"

alias k_n="kubectl get nodes -o wide"
alias k_a="kubectl get all -o wide"

alias .k_igor_pod_create="kubectl run igor-network-utils --image=amouat/network-utils  ping 1.1.1.1"
alias .k_igor_pod="kubectl exec -it igor-network-utils -- bash"
