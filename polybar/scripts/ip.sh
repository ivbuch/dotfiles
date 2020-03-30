#!/bin/bash
url="ifconfig.co"
body_file="/tmp/_check_ip_response"
curl_res=$(curl -s $url -o $body_file -v 2>&1)

if [[ "$curl_res" == *"HTTP/1.1 200 OK"* ]] ; then
  ip="$(cat $body_file)"
  echo "⚽ $ip"
else  
  echo "⚽ no ip determined"
fi
