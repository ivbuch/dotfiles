#!/bin/bash
em="☢️"
ping 8.8.8.8 -w 1 -c 1 1>/dev/null 2>/dev/null
if [[ "$?" -ne 0 ]] ; then
  echo "$em %{F#FF0000} INTERNET%{F-}"
else
  echo "$em INTERNET"
fi
