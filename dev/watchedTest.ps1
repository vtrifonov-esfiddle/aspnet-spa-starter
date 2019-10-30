function WatchedTestDotnet() {
    $SourcesPath = Resolve-Path "$PSScriptRoot\..\src-test"
    docker run --rm -it -v "$($SourcesPath):/app" -w /app mcr.microsoft.com/dotnet/core/sdk:3.0 dotnet watch test
}

function WatchedTestReact() {
    docker exec -it aspnet-react-container.dev npm test --prefix /app/ClientApp
}

WatchedTestReact
# WatchedTestDotnet