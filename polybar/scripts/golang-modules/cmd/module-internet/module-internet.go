package main

import (
	"bytes"
	"fmt"
	"net"
	"os"
	"os/exec"
	"strings"
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
	cmd := exec.Command("ping", "-c 1", "-W 1", "1.1.1.1")
	cmd.Stdin = strings.NewReader("some input")
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		return false
	}
	return true
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
