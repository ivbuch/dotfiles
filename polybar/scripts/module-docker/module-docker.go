package main

import (
	"context"
	"fmt"
	"os"

	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/filters"
	"github.com/docker/docker/client"
)

func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv)
	if err != nil {
		panic(err)
	}
	cli.NegotiateAPIVersion(ctx) // this line can negotiate API version

	containers := getContainersCount(cli)
	healthContainers := getHealthyContainers(cli)
	if healthContainers != containers {
		fmt.Printf("🐳 %d (%%{F#FF0000}%d ❤️%%{F-})", containers, healthContainers)
		os.Exit(0)
	}
	fmt.Printf("🐳 %d (%d ❤️)", containers, healthContainers)
}

func getContainersCount(client *client.Client) int {
	containers, err := client.ContainerList(context.Background(), types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
	return len(containers)
}

func getHealthyContainers(client *client.Client) int {

	filter := filters.NewArgs()
	filter.Add("health", "healthy")

	containers, err := client.ContainerList(context.Background(), types.ContainerListOptions{Filters: filter})
	if err != nil {
		panic(err)
	}
	return len(containers)
}
