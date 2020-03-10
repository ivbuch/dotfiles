#!/bin/bash

containers=$(docker ps -q | wc -l)
health=$(docker ps --filter="health=healthy" -q | wc -l)

if [ "$health" -lt "$containers" ]; then
  echo "🐳 $containers (%{F#FF0000}$health ❤️%{F-})"
else
  echo "🐳 $containers ($health ❤️)"
fi
