.aws_ec2_igor() {
  local query
  query='.Reservations[].Instances[] | select (.KeyName != null) | select(.KeyName | contains("igor")) | {Name: .KeyName, NewName: (.Tags[] | select (.Key == "Name") | .Value), PublicIP: .PublicIpAddress, State: .State.Name, Tags: .Tags}'

  aws ec2 describe-instances  | jq "$query"
}

.aws_ec2_all() {
  local query
  query='.Reservations[].Instances[] | {Name: .KeyName, NewName: (.Tags[] | select (.Key == "Name") | .Value), PublicIP: .PublicIpAddress, PrivateIpAddress: .PrivateIpAddress, State: .State.Name}'

  aws ec2 describe-instances  | jq "$query"
}

.aws_s3_ls_kops_dev() {
  aws s3 ls "$(cat ~/.config/work/kops-dev-s3)" | awk '
  $0 !~ /Auto cleaned/ && $0 !~ /keys/ && $0 !~ /^[1-9]/ && $0 !~ /agent-automation/ {
    v = substr($2, 1, length($2) - length("/"))
    print v
  }
  '
}

.aws_s3_ls_kops_dev_qa() {
  aws s3 ls "$(cat ~/.config/work/kops-dev-qa-s3)" | awk '
  $0 !~ /Auto cleaned/ {
    v = substr($2, 1, length($2) - length("/"))
    print v
  }
  '
}

.aws_ec2_vpcs_count() {
  aws ec2 describe-vpcs | jq ".Vpcs | length"
}

### .kops-config-s3-dev-qa !!! import kops cluster from s3 qa bucket
.kops-config-s3-dev-qa() {
  envs=$(aws s3 ls "$(cat ~/.config/sysdig/kops-dev-qa-s3)" | awk '
  $0 !~ /Auto cleaned/ {
    v = substr($2, 1, length($2) - length("/"))
    print v
  }
  ')
  selected_env=$(echo "${envs}" | fzf -e --nth=1 --tac --multi)
  if [[ "$?" -ne "0" ]]; then
    echo "no choice"
    return
  fi
  KOPS_STATE_STORE=${KOPS_STATE_QA_STORE} kops export kubecfg --name "${selected_env}" --admin
  kubectl config set-context --current --namespace sysdigcloud
}
