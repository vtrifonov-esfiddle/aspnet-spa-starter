#!/bin/bash

function build() {
    VERSION=$1
    ContextDir="../../../../src"
    ImageId="$DOCKER_REGISTRY/aspnet-react-container"
    DockerfilePath="../Dockerfile"
    docker build -f $DockerfilePath -t $ImageId:$VERSION $ContextDir
    #docker push $ImageId:$VERSION
}

build "v0.0.2-local"