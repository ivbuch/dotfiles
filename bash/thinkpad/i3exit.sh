#!/bin/sh

lock() {
    i3lock
}

case "$1" in
    lock)
        lock
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        source /home/igor/workspace/dotfiles/systemd/scripts/on-boot.sh
	notify-send "Going to sleep..."
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
