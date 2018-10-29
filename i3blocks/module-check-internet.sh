#!/bin/bash
ping 8.8.8.8 -w 1 -c 1 1>/dev/null 2>/dev/null
if [[ "$?" -ne 0 ]] ; then
  echo "<span foreground='#ffffff' background='#B03060'> 🔔 No INTERNET 🔔 </span>"
fi
