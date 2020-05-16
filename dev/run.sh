function run() {
    VERSION=$1
    
    docker run \
        -p 45000:80 \
        $DOCKER_REGISTRY/aspnet-spa-starter:$VERSION
}

run "v0.3.0-local"