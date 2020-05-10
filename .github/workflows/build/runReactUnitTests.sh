# RepoRootPath=/host_mnt/c/GithubRepos/aspnet-react-container
RepoRootPath=$PWD

docker run  \
    --volume $RepoRootPath/src/ClientApp:/app/ClientApp:cached \
    --volume react-unit-tests-node_modules:/app/ClientApp/node_modules \
    --workdir /app/ClientApp \
    --name react-unit-tests \
    --rm \
    node:12 bash \
    -c "npm ci && CI=true npm test --reporters=\"jest-junit\""

cp $RepoRootPath/src/ClientApp/junit.xml /app/testResults/reactUnitTests.xml
     