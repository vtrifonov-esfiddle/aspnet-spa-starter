$SrcDir = Resolve-Path "$PSScriptRoot\..\..\..\..\src"

docker run --volume "$SrcDir/ClientApp:/app/ClientApp" -w /app/ClientApp node:12 bash -c "CI=true npm test"