docker run  \
    --volume $WORKSPACE_DIR_DOCKER_MOUNT/src/ClientApp:/app/ClientApp:cached \
    --volume spa-unit-tests-node_modules:/app/ClientApp/node_modules \
    --workdir /app/ClientApp \
    --name spa-unit-tests \
    --rm \
    node:12 bash \
    -c "npm ci && CI=true npm test --reporters=\"jest-junit\""

mkdir $REPO_ROOT_DIR/testResults
cp $REPO_ROOT_DIR/src/ClientApp/junit.xml $REPO_ROOT_DIR/testResults/spaUnitTests.xml
     