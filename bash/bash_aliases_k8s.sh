alias k="kubectl"
alias m="minikube"
alias ma="minikube-agent"

alias .k8_igor_pod_create="kubectl run igor-network-utils --image=ivbuch/igor-network-utils:0.1"
alias .k8_igor_pod_exec="kubectl exec -it igor-network-utils -- bash"

alias .k8_goutils_pod_create="kubectl run igor-go-utils --image=ivbuch/go-utils:0.3 --image-pull-policy=Always"
alias .k8_goutils_pod_exec="kubectl exec -it igor-go-utils -- bash"
