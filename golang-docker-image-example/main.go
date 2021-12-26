package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "{\"status\":\"up\"}")
	})
	fmt.Println("Server Started at 9035")
	http.ListenAndServe(":9035", nil)
}
