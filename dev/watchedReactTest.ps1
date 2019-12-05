function WatchedTestReact($ContainerTag, $ContainerName) {
    $SourcesPath = Resolve-Path "$PSScriptRoot\..\src\ClientApp"
    docker run --rm -it -v "$($SourcesPath):/app/ClientApp" -w /app/ClientApp --name $ContainerName $ContainerTag npm test
}

function BuildContainer($ContainerTag) {
    $ContextDir = Resolve-Path "$PSScriptRoot\..\src"
    docker build -f $PSScriptRoot\Dockerfile -t $ContainerTag $ContextDir
}

$ContainerTag = "vtrifonovdocker/react-unit-test-container:dev"
$ContainerName = "react-unit-test-container.dev"

BuildContainer $ContainerTag
WatchedTestReact $ContainerTag $ContainerName