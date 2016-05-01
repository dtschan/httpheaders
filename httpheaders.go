package main

import (
  "fmt"
  "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
  for key, value := range r.Header {
    fmt.Fprintf(w, "%s: %s\n", key, value)
  }
}

func main() {
  http.HandleFunc("/", handler)
  http.ListenAndServe(":8080", nil)
}
