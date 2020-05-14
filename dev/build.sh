#!/bin/bash

function build() {
    VERSION=$1
    ContextDir="/app/src"
    ImageId="$DOCKER_REGISTRY/aspnet-react-container"
    DockerfilePath="/app/.github/workflows/ci/Dockerfile"
    docker build -f $DockerfilePath -t $ImageId:$VERSION $ContextDir
    #docker push $ImageId:$VERSION
}

build "v0.1.0-local"