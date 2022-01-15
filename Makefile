proto-gen:
	@docker build --platform linux/amd64 -t twirp-example -f Dockerfile .
	@echo Generation go code from proto...
	docker run --rm -v ${PWD}/proto:/proto -v ${PWD}/proto_gen:/proto_gen twirp-example \
		-I./proto \
		--go_out=paths=source_relative:proto_gen/go \
		--twirp_out=paths=source_relative:proto_gen/go \
		./proto/hello.proto
.PHONY: proto-gen

#	@for file in $(shell find ./interface/rpc -iname "*.proto"); do \
#      prefix="./interface/rpc"; \
#      suffix="service.proto"; \
#      proto_dir=`echo "$$file" | sed -e "s|^$$prefix||" -e "s|$$suffix$$||"`; \
#	  docker run --rm -v ${PWD}/proto:/proto -v ${PWD}/interface/rpc:/interface/rpc -v ${PWD}/doc/$${proto_dir}:/out -v ${PWD}/doc:/doc protoc-beer-server $(PROTOC_GO_OPTION) $${file}; \
#	done
#	@echo Done
