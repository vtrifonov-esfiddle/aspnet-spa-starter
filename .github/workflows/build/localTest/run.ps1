$env:DOCKER_REPOSITORY = "docker.pkg.github.com/vtrifonov-esfiddle"
$env:VERSION = "v0.0.0-local"

docker-compose -f "$PSScriptRoot\..\docker-compose.yaml" up --detach