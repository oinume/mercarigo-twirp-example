package helloserver

import (
	"context"

	"github.com/twitchtv/twirp"

	"github.com/oinume/twirp-example/rpc/hello"
)

type Service struct{}

func (s *Service) Echo(ctx context.Context, request *hello.EchoRequest) (*hello.EchoResponse, error) {
	if request.Message == "" {
		return nil, twirp.InvalidArgumentError("message", "required")
	}
	return &hello.EchoResponse{
		Message: request.Message,
	}, nil
}
