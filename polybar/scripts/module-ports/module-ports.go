package main

import (
	"fmt"
	"net"
	"time"
)

func portOpen(host string, port string) bool {
	timeout := time.Millisecond * 50
	conn, _ := net.DialTimeout("tcp", net.JoinHostPort(host, port), timeout)
	if conn != nil {
		defer conn.Close()
		return true
	}
	return false
}

func main() {
	collectorUp := portOpen("localhost", "6666")
	apiUp := portOpen("localhost", "9000")
	fmt.Printf("👀 SysDig: %s%s", toImage(collectorUp), toImage(apiUp))
}

func toImage(portOpen bool) string {
	if portOpen {
		return "🟢"
	}
	return "🔴"
}
