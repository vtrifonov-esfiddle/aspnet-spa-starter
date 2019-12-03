function WatchedRunReact($hostPort = 45001) {
    $SourcesPath = Resolve-Path "$PSScriptRoot\..\src\ClientApp"
    docker run --rm -it -p "$($hostPort):5000" -v "$($SourcesPath):/app/ClientApp" -w /app/ClientApp vtrifonovdocker/react-container:dev npm install

    $ContainerName = "react-container.dev"
    docker run --rm -it -p "$($hostPort):3000" -v "$($SourcesPath):/app/ClientApp" -w /app/ClientApp --name $ContainerName vtrifonovdocker/react-container:dev npm start
}

function DevBuild() {
    $ContextDir = Resolve-Path "$PSScriptRoot\..\src"
    $Tag = "vtrifonovdocker/react-container:dev"    
    docker build -f $PSScriptRoot\Dockerfile -t $Tag $ContextDir
}

DevBuild
WatchedRunReact