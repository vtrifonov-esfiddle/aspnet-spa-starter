function WatchedRun($hostPort = 45000) {
    $SourcesPath = Resolve-Path "$PSScriptRoot\..\src"
    docker run --rm -v "$($SourcesPath):/app" vtrifonovdocker/aspnet-react-container:dev dotnet restore
    docker run --rm -it -p "$($hostPort):5000" -v "$($SourcesPath):/app" -w /app/ClientApp vtrifonovdocker/aspnet-react-container:dev npm install
    docker run --rm -it -p "$($hostPort):5000" -v "$($SourcesPath):/app" vtrifonovdocker/aspnet-react-container:dev dotnet watch run --urls "http://0.0.0.0:5000"
}

function DevBuild() {
    $ContextDir = Resolve-Path "$PSScriptRoot\..\src"
    $tag = "vtrifonovdocker/aspnet-react-container:dev"
    docker build -f $PSScriptRoot\Dockerfile -t $tag $ContextDir
}

DevBuild
WatchedRun 45000