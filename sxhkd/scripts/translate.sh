#!/bin/bash

text="$(echo | dmenu)"
termite -e "bash -c \"trans $1 $text --no-ansi | less\""
