package main

import (
	"net/http"
	"os"
)

func main() {
	if os.Getenv("HEALTHCHECK_URL") != "" {
		if _, err := http.Get(os.Getenv("HEALTHCHECK_URL")); err != nil {
			os.Exit(1)
		}
	}
}
