package main

import (
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func main() {
	cmd := "VBoxManage list runningvms | wc -l"
	out, err := exec.Command("bash", "-c", cmd).Output()
	if err != nil {
		fmt.Fprintf(os.Stderr, "error executing "+err.Error())
		os.Exit(1)
	}
	s := strings.Trim(string(out), "\n")
	count, err := strconv.Atoi(s)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error executing "+err.Error())
		os.Exit(1)
	}
	fmt.Printf("VMs: %d", count)
}
