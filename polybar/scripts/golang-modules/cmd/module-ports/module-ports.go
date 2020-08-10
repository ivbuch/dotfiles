package main

import (
	"fmt"
	"github.com/mitchellh/go-ps"
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
	agentRunning := isAgentRunning()
	apiUp := portOpen("localhost", "9000")
	fmt.Printf("👀 SysDig: %s %s", toImage(apiUp), toImage(agentRunning))
}

func isAgentRunning() bool {
	processes, err := ps.Processes()
	if err != nil {
		panic(err)
	}
	for _, proc := range processes {
		if proc.Executable() == "dragent" {
			return true
		}
	}
	return false
}

func toImage(green bool) string {
	if green {
		return "🟢"
	}
	return "🔴"
}
