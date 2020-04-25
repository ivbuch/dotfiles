package main

import (
	"fmt"
	"log"
	"os/exec"
	"strings"
)

func main() {
	pacmanUpdates := getPacmanUpdates()
	aurUpdates := getAurUpdates()
	print(pacmanUpdates, aurUpdates)
}

func getPacmanUpdates() int {
	out, err := exec.Command("checkupdates").Output()
	if err != nil {
		log.Fatalln(err)
	}
	s := string(out)
	return strings.Count(s, "\n")
}

func getAurUpdates() int {
	out, err := exec.Command("trizen", "-Su", "--aur", "--quiet").Output()
	if err != nil {
		log.Fatalln(err)
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
