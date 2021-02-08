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
  aws s3 ls "$(cat ~/.config/work/kops-dev-s3)"
}

.aws_s3_ls_kops_dev_qa() {
  aws s3 ls "$(cat ~/.config/work/kops-dev-qa-s3)"
}

.aws_ec2_vpcs_count() {
  aws ec2 describe-vpcs | jq ".Vpcs | length"
}
