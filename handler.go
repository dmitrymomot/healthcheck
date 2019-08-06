package healthcheck

import "net/http"

// Handler func handles health check request
// Always responses with status 200
func Handler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("."))
}
