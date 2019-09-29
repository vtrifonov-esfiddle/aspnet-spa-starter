function Build($majorVersion, $minorVersion) {
    $ContextDir = Resolve-Path "$PSScriptRoot\..\src"
    $version = "v$majorVersion.$minorVersion"
    $tag = "vtrifonovdocker/aspnet-react-container:prod-$version"
    docker build -f $PSScriptRoot\Dockerfile -t $tag $ContextDir
    docker push $tag
}

Build 1 0