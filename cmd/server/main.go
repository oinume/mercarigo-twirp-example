package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/oinume/twirp-example/internal/helloserver"
	"github.com/oinume/twirp-example/rpc/hello"
)

func main() {
	mux := http.NewServeMux()
	server := hello.NewHelloServer(&helloserver.Service{})
	mux.Handle(hello.HelloPathPrefix, server)
	fmt.Printf("Starting HTTP server on 8080\n")
	if err := http.ListenAndServe(":8080", mux); err != nil {
		log.Fatal(err)
	}
}
