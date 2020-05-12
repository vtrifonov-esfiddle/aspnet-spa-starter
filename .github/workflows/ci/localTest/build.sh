#!/bin/bash

function build() {
    DOCKER_REGISTRY=$1
    VERSION=$2
    ContextDir="../../../../src"
    ImageId="$DOCKER_REGISTRY/aspnet-react-container"
    DockerfilePath="../Dockerfile"
    docker build -f $DockerfilePath -t $ImageId:$VERSION $ContextDir
    docker push $ImageId:$VERSION
}

build "docker.pkg.github.com/vtrifonov-esfiddle/aspnet-react-container" "v0.0.2-local"