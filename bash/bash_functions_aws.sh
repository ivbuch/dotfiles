.aws_ec2_igor() {
  local query
  query='.Reservations[].Instances[] | select (.KeyName != null) | select(.KeyName | contains("igor")) | {Name: .KeyName, NewName: (.Tags[] | select (.Key == "Name") | .Value), PublicIP: .PublicIpAddress, State: .State.Name, Tags: .Tags}'

  aws ec2 describe-instances  | jq "$query"
}

.aws_ec2_all() {
  local query
  query='.Reservations[].Instances[] | {Name: .KeyName, NewName: (.Tags[] | select (.Key == "Name") | .Value), PublicIP: .PublicIpAddress, State: .State.Name}'

  aws ec2 describe-instances  | jq "$query"
}

.aws_s3_ls_kops() {
  aws s3 ls s3://kops-dev-draios-com
}
