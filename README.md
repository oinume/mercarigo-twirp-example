# twirp-example

The simplest example of [Twirp](https://github.com/twitchtv/twirp).

## Directory structure

- rpc/hello
  - service.proto - RPC definition
- internal
  - helloserver - Server implementation 
- cmd
  - server - main function for the server 

## Requirement

- Docker
- Go

## Build and run server

Build server.

```
$ make proto-gen
$ make build-server
```

Run the server.

```
$ ./server
```

Send request to the server
```
$ curl -X POST -H 'Content-Type: application/json' -d '{"message": "mercari.go #18"}' http://localhost:8080/twirp/twirp.example.hello.Hello/Echo
```