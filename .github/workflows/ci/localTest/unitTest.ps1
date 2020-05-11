$SrcDir = Resolve-Path "$PSScriptRoot\..\..\..\..\src"

docker run `
    --volume $SrcDir/ClientApp:/app/ClientApp:cached `
    --volume react-unit-tests-node_modules:/app/ClientApp/node_modules `
    --workdir /app/ClientApp `
    --name react-unit-tests `
    --rm `
    node:12 bash `
    -c "npm ci && CI=true npm test"    