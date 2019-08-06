package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/dmitrymomot/healthcheck"
	"github.com/go-chi/chi"
)

func main() {
	r := chi.NewRouter()
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("welcome"))
	})

	// Set up healthcheck handler (you can use your own)
	r.Get("/health", healthcheck.Handler)

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", os.Getenv("APP_PORT")), r))
}
