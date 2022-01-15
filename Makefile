proto-gen:
	@docker build --platform linux/amd64 -t twirp-example -f Dockerfile .
	@echo Generating go code from proto ...
	docker run --rm -v ${PWD}/rpc:/rpc twirp-example -I. \
		--go_out=paths=source_relative:. \
		--twirp_out=paths=source_relative:. \
		./rpc/hello/service.proto
.PHONY: proto-gen
