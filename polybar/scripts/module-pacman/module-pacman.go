package main

import (
	"bytes"
	"fmt"
	"log"
	"os/exec"
	"strings"
	"syscall"
)

func main() {
	pacmanUpdates := getPacmanUpdates()
	aurUpdates := getAurUpdates()
	print(pacmanUpdates, aurUpdates)
}

func getPacmanUpdates() int {
	cmd := exec.Command("checkupdates")
	var outbuf, errbuf bytes.Buffer
    cmd.Stdout = &outbuf
    cmd.Stderr = &errbuf
	err := cmd.Run()
	if err != nil {
		if exitError, ok := err.(*exec.ExitError); ok {
			ws := exitError.Sys().(syscall.WaitStatus)
			exitCode := ws.ExitStatus()
			if exitCode == 2 {
				return 0
			}
			log.Fatalln("checkupdates, " + err.Error())
		}
	}
	s := string(outbuf.Bytes())
	return strings.Count(s, "\n")
}

func getAurUpdates() int {
	out, err := exec.Command("trizen", "-Su", "--aur", "--quiet").Output()
	if err != nil {
		log.Fatalln("trizen=" + err.Error())
	}
	s := string(out)
	return strings.Count(s, "\n")
}

func print(pacmanUpdates, aurUpdates int) {
	clStart := "%{F#FF0000}"
	clEnd := "%{F-}"
	if pacmanUpdates == 0 && aurUpdates == 0 {
		clStart = ""
		clEnd = ""
	}

	fmt.Printf("🍺 %s%d (%d)%s", clStart, pacmanUpdates, aurUpdates, clEnd)
}
