.aws_ec2_igor() {
  local query
  query='.Reservations[].Instances[] | select (.KeyName != null) | select(.KeyName | contains("igor")) | {Name: .KeyName, NewName: (.Tags[] | select (.Key == "Name") | .Value), PublicIP: .PublicIpAddress}'

  aws ec2 describe-instances  | jq "$query"
}

.aws_ec2_all() {
  local query
  query='.Reservations[].Instances[] | {Name: .KeyName, NewName: (.Tags[] | select (.Key == "Name") | .Value), PublicIP: .PublicIpAddress}'

  aws ec2 describe-instances  | jq "$query"
}
