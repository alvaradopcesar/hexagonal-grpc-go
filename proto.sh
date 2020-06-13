#!/bin/bash

for f in $(find . -name "*.proto");
do
    echo $f
    protoc -I/usr/local/include -I. -I${GOPATH}/src \
	-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
    --grpc-gateway_out=logtostderr=true:. \
    --swagger_out=logtostderr=true:. \
	--go_out=plugins=grpc:. \
    $f
done
