#!/bin/bash

dns=$'DNS: /etc/resolv.conf\n'
dns="$dns$(cat /etc/resolv.conf)"
notify-send "$dns"
