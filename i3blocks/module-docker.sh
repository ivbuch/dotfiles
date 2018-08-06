#!/bin/bash

containers=$(docker ps -q | wc -l)
health=$(docker ps --filter="health=healthy" -q | wc -l)
echo "Docker:  $health ($containers)"
