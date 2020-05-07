function Build($DOCKER_REPOSITORY, $VERSION) {
    $ContextDir = Resolve-Path "$PSScriptRoot\..\..\..\..\src"
    $Tag = "$DOCKER_REPOSITORY/aspnet-react-container:$VERSION"
    $DockerfilePath = Resolve-Path "$PSScriptRoot\..\Dockerfile"
    docker build -f $DockerfilePath -t $Tag $ContextDir
    # docker push $Tag
}

Build "docker.pkg.github.com/vtrifonov-esfiddle/aspnet-react-container" "v0.0.1-local"