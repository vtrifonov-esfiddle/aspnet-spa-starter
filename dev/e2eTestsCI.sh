currentDir=$PWD
cd /app/.github/workflows/ci/e2eTests

TEST_RESULTS_PATH=$WORKSPACE_DIR_DOCKER_MOUNT/e2eTestResults \
VERSION=v0.3.0-local \
docker-compose run e2e-tests

cd $currentDir