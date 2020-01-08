#!/bin/bash

start_pomodoro_timer() {
  sec="$(($1 * 60))"
  sleep "$sec" && zenity --error --text="$1 minutes passed. Have a break!" --width=800 --height=600
}

