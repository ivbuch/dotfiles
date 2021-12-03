package main

import (
	"fmt"
	"log"
	"os/exec"
	"strings"
)

func main() {
	dotfilesChanged := hasChanges("/my-tools/dotfiles")
	hiChanged := hasChanges("/my-tools/home-infra")

	fmt.Printf("GIT %s %s", toImage(dotfilesChanged), toImage(hiChanged))
}

func toImage(changed bool) string {
	if changed {
		return "🔴"
	}
	return "🟢"
}

func hasChanges(gitRepo string) bool {
	cmd := exec.Command("git", "status")
	cmd.Dir = gitRepo
	o, err := cmd.Output()
	if err != nil {
		log.Fatal(err)
	}
	s := string(o)
	if strings.Contains(s, "ahead of") {
		return true
	}
	if !strings.Contains(s, "nothing to commit") {
		return true
	}
	return false
}
