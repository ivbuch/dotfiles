package main

import (
	"fmt"
	"log"
	"net"
	"os"
	"time"

	"github.com/sparrc/go-ping"
)

func main() {
	isInternetUp := isInternetUp()
	isDNSOK := isDNSOK()
	isPiholeOk := isPiholeOk()
	isWireguardEnabled := isWireguardEnabled()

	fmt.Printf("🌎  %s%s  📛%s 🔒%s ",
		getIcon(isInternetUp),
		getIcon(isDNSOK),
		getIcon(isPiholeOk),
		getIconWireguard(isWireguardEnabled))
}

func isInternetUp() bool {
	pinger, err := ping.NewPinger("8.8.8.8")
	if err != nil {
		log.Fatal(err)
	}
	pinger.Count = 1
	pinger.Timeout = time.Second
	pinger.Run()
	stats := pinger.Statistics()
	return stats.PacketsRecv == 1
}

func isDNSOK() bool {
	_, err := net.LookupHost("google.com")
	return err == nil
}

func isPiholeOk() bool {
	addresses, err := net.LookupHost("googleadservices.com")
	if err != nil {
		return false
	}

	for _, v := range addresses {
		if v == "0.0.0.0" {
			return true
		}
	}
	return false
}

func isWireguardEnabled() bool {
	f := "/sys/class/net/wg0"
	_, err := os.Stat(f)
	if os.IsNotExist(err) {
		return false
	}
	return true
}

func getIcon(isGreen bool) string {
	if isGreen {
		return "🟢"
	}
	return "🔴"
}

func getIconWireguard(isGreen bool) string {
	if isGreen {
		return getIcon(isGreen)
	}
	return "🟡"
}
