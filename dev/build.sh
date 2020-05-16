function build() {
    VERSION=$1
    ContextDir="/app/src"
    ImageId="$DOCKER_REGISTRY/aspnet-spa-starter"
    DockerfilePath="/app/.github/workflows/ci/Dockerfile"
    docker build -f $DockerfilePath -t $ImageId:$VERSION $ContextDir
}

build "v0.3.0-local"
