function WatchedRunReact($ContainerTag, $ContainerName, $hostPort = 45001) {
    $SourcesPath = Resolve-Path "$PSScriptRoot\..\src\ClientApp"
    docker run --rm -it -v "$($SourcesPath):/app/ClientApp" -w /app/ClientApp $ContainerTag npm install
    docker run --rm -it -p "$($hostPort):3000" -v "$($SourcesPath):/app/ClientApp" -w /app/ClientApp --name $ContainerName $ContainerTag npm start
}

function BuildContainer($ContainerTag) {
    $ContextDir = Resolve-Path "$PSScriptRoot\..\src" 
    docker build -f $PSScriptRoot\Dockerfile -t $ContainerTag $ContextDir
}

$ContainerTag = "vtrifonovdocker/react-container:dev"
$ContainerName = "react-container.dev"

BuildContainer $ContainerTag 
WatchedRunReact $ContainerTag $ContainerName