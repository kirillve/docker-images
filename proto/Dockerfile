FROM golang:1.14-buster

RUN apt update && apt -y install automake autoconf autogen libtool shtool unzip

RUN export PROTOC_VERSION=3.11.4 \
    && export PROTOC_ZIP=protoc-${PROTOC_VERSION}-linux-x86_64.zip \
    && curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/${PROTOC_ZIP} \
    && unzip -o ${PROTOC_ZIP} -d /usr/local bin/protoc \
    && unzip -o ${PROTOC_ZIP} -d /usr/local 'include/*' \
    && rm -f ${PROTOC_ZIP}

RUN PROTOBUF_GIT_TAG="v1.3.5" \
    && rm -fr ${GOPATH}/src/github.com/golang/protobuf \
    && rm -fr ${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway \
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway \
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger \
    && go get -d -u github.com/golang/protobuf/protoc-gen-go \
    && git -C ${GOPATH}/src/github.com/golang/protobuf pull origin master \
    && git -C ${GOPATH}/src/github.com/golang/protobuf checkout master \
    && git -C ${GOPATH}/src/github.com/golang/protobuf checkout tags/${PROTOBUF_GIT_TAG} \
    && go install github.com/golang/protobuf/protoc-gen-go

RUN cd /tmp \
    && git clone -b $(curl -fsSL https://grpc.io/release) https://github.com/grpc/grpc \
    && cd grpc \
    && git submodule update --init \
    && cd /tmp/grpc/ \
    && make \
    && make install \
    && rm -rf /tmp/grpc
