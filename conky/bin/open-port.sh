#!/bin/bash
if nc -z -w5 $1 $2; then
  echo -n '${color green}Open$color'
else
  echo -n '${color red}Closed$color'
fi
