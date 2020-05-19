docker build  \
  --file karmaUnitTests.Dockerfile \
  --tag spa-karma-unit-tests:latest \
  $REPO_ROOT_DIR/src

docker run  \
    --volume $WORKSPACE_DIR_DOCKER_MOUNT/src/ClientApp:/app/ClientApp:cached \
    --volume spa-unit-tests-node_modules:/app/ClientApp/node_modules \
    --name spa-unit-tests \
    --rm \
    spa-karma-unit-tests:latest

mkdir -p $REPO_ROOT_DIR/testResults
cp -r $REPO_ROOT_DIR/src/ClientApp/coverage/aspnet-spa-starter $REPO_ROOT_DIR/testResults/spa-karma-unit-tests
     