package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

const url = "https://ifconfig.co"

func main() {

	resp, err := http.Get(url)
	defer resp.Body.Close()

	if err != nil {
		log.Fatal(err)
	}
	if resp.StatusCode == 200 {
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			log.Fatal(err)
		}
		msg := string(body)
		print(msg)
		return
	}
	print("no ip determined")
}

func print(msg string) {
	if len(msg) > 22 {
		msg = msg[0:22] + "..."
	}
	fmt.Printf("⚽ %s", msg)
}
