#!/bin/bash
if nc -z -w2 $1 $2; then
  echo -n '${color green}Open$color'
else
  echo -n '${color red}...$color'
fi
