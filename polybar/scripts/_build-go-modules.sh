#!/bin/bash

output="$HOME/.bin/go-scripts"

go build -o "$output/gi-docker-module" docker-module.go
go build -o "$output/gi-borg-module" borg-module/borg-module.go
