package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"time"
)

const (
	borgLogFile      = "/home/igor/.config/borg/date.log"
	backupExpireDays = 14
)

func main() {

	_, err := os.Stat(borgLogFile)
	if os.IsNotExist(err) {
		printBad()
		os.Exit(0)
	}

	bytes, _ := ioutil.ReadFile(borgLogFile)
	text := strings.Trim(string(bytes), "\n\r ")
	backupDate, err := time.Parse("2006-01-02", text)

	if err != nil {
		printBad()
		return
	}

	var days = int(time.Now().Sub(backupDate).Hours() / 24)
	if days > backupExpireDays {
		printBad()
	}
}

func printBad() {
	fmt.Println("%{F#FF0000}💔 BORG 💔%{F-}")
}
