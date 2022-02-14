# FreeAgent puts the powerline style in zsh !

if [ "$POWERLINE_DATE_FORMAT" = "" ]; then
  POWERLINE_DATE_FORMAT=%D{%Y-%m-%d}
fi

if [ "$POWERLINE_RIGHT_B" = "" ]; then
  POWERLINE_RIGHT_B=%D{%H:%M:%S}
elif [ "$POWERLINE_RIGHT_B" = "none" ]; then
  POWERLINE_RIGHT_B=""
fi

if [ "$POWERLINE_RIGHT_A" = "mixed" ]; then
  POWERLINE_RIGHT_A=%(?."$POWERLINE_DATE_FORMAT".%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "exit-status" ]; then
  POWERLINE_RIGHT_A=%(?.%F{green}✔ %?.%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "exit-status-on-fail" ]; then
  POWERLINE_RIGHT_A=%(?..%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "date" ]; then
  POWERLINE_RIGHT_A="$POWERLINE_DATE_FORMAT"
fi

if [ "$POWERLINE_SHORT_HOST_NAME" = "" ]; then
    POWERLINE_HOST_NAME="%M"
else
    POWERLINE_HOST_NAME="%m"
fi

if [ "$POWERLINE_HIDE_USER_NAME" = "" ] && [ "$POWERLINE_HIDE_HOST_NAME" = "" ]; then
    POWERLINE_USER_NAME="%n@$POWERLINE_HOST_NAME"
elif [ "$POWERLINE_HIDE_USER_NAME" != "" ] && [ "$POWERLINE_HIDE_HOST_NAME" = "" ]; then
    POWERLINE_USER_NAME="@$POWERLINE_HOST_NAME"
elif [ "$POWERLINE_HIDE_USER_NAME" = "" ] && [ "$POWERLINE_HIDE_HOST_NAME" != "" ]; then
    POWERLINE_USER_NAME="%n"
else
    POWERLINE_USER_NAME=""
fi

if [ "$POWERLINE_PATH" = "full" ]; then
  POWERLINE_PATH="%1~"
elif [ "$POWERLINE_PATH" = "short" ]; then
  POWERLINE_PATH="%~"
else
  POWERLINE_PATH="%d"
fi

if [ "$POWERLINE_CUSTOM_CURRENT_PATH" != "" ]; then
  POWERLINE_CURRENT_PATH="$POWERLINE_CUSTOM_CURRENT_PATH"
fi

if [ "$POWERLINE_RIGHT_A_COLOR_FRONT" = "" ]; then
  POWERLINE_RIGHT_A_COLOR_FRONT="white"
fi

if [ "$POWERLINE_RIGHT_A_COLOR_BACK" = "" ]; then
  POWERLINE_RIGHT_A_COLOR_BACK="black"
fi

if [ $(id -u) -eq 0 ]; then
    POWERLINE_SEC1_BG=%K{red}
    POWERLINE_SEC1_FG=%F{red}
else
    POWERLINE_SEC1_BG=%K{green}
    POWERLINE_SEC1_FG=%F{green}
fi
POWERLINE_SEC1_TXT=%F{black}
if [ "$POWERLINE_DETECT_SSH" != "" ]; then
  if [ -n "$SSH_CLIENT" ]; then
    POWERLINE_SEC1_BG=%K{red}
    POWERLINE_SEC1_FG=%F{red}
    POWERLINE_SEC1_TXT=%F{white}
  fi
fi

if [ "$VIRTUAL_ENV" != "" ] && [ "$POWERLINE_HIDE_VIRTUAL_ENV" = "" ]; then
    VENV_NAME=$(basename "$VIRTUAL_ENV")
    VENV_STATUS="($POWERLINE_SEC1_TXT$VENV_NAME)"
else
    VENV_STATUS=""
fi

PROMPT="%k"" "

precmd() {
  exit_status="$?"
  color_start="%F{red}"
  color_end="%f"
  exit_status_colorful=$(echo "[🛑 status: %F{red} ${exit_status}%f ]")
  if ! k8_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null) then
    k8_namespace="none"
  fi
 
  k8_context="$(kubectl config current-context 2>/dev/null || echo none)🔥${k8_namespace}"
  k8_context_colorful="${color_start}${k8_context} ${color_end}"

  host="$(hostname)"
  host_colorful="%F{red}${host}%f"

  cpath="$(pwd)"
  cpath_colorful="${color_start}${cpath}${color_end}"

  LEFT="\n$(echo -e '\033(0lq\033(B') 📂 l [${cpath_colorful}] at [${host_colorful}] [k8s-context: ${k8_context_colorful}]"
  RIGHT=" ${exit_status_colorful}"
  RIGHTWIDTH=$(($COLUMNS-${#LEFT}))
  print -P $LEFT${(l:$RIGHTWIDTH::-:)RIGHT}
  echo -e '\033(0x'
}

preexec() {
  echo ""
}

RPROMPT=""
PROMPT="$(echo -e '\033(0mq\033(B') 💀 ] $PROMPT"
