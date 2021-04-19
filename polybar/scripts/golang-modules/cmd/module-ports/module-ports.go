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
	apiUp := portOpen("localhost", "9000")
	fmt.Printf("9090: %s", toImage(apiUp))
}

func toImage(green bool) string {
	if green {
		return "+"
	}
	return "-"
}
