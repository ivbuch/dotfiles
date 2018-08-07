#!/bin/bash

containers=$(docker ps -q | wc -l)
health=$(docker ps --filter="health=healthy" -q | wc -l)

if [ "$health" -lt "$containers" ]; then
  echo "🐳 $containers (<span foreground='#ff0000'>$health ❤️</span>"
else
  echo "🐳 $containers ($health ❤️)"
fi
