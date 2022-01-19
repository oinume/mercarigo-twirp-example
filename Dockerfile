FROM golang:1.17-bullseye

ARG PROTOC_VERSION=3.19.3
ARG PROTOC_GEN_GO_VERSION=1.27.1
ARG PROTOC_GEN_TWIRP=8.1.1

WORKDIR /

# protoc
ADD https://github.com/google/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip ./
RUN apt-get -q -y update && \
  apt-get -q -y install --no-install-recommends unzip && \
  unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d ./usr/local && \
  rm protoc-${PROTOC_VERSION}-linux-x86_64.zip && \
  apt-get remove --purge -y unzip && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/* && \
  go get \
    google.golang.org/protobuf/cmd/protoc-gen-go@v${PROTOC_GEN_GO_VERSION} \
    github.com/twitchtv/twirp/protoc-gen-twirp@v${PROTOC_GEN_TWIRP}

ENTRYPOINT ["protoc", "--plugin=/go/bin/protoc-gen-go", "--plugin=/go/bin/protoc-gen-twirp"]
