# aspnet-spa-starter

A starter template for development of ASP .NET Core SPA inside Docker containers with Visual Studio Code
- tech stack
  - ASP .NET Core
  - SPA (React/Vue.js/Angular)
    - with typescript
  - e2e tests - cypress
  - SPA unit tests 
    |React|Vue.js|Angular|
    |-----|------|-------|
    |jest |jest  |karma  |
  - .NET xUnit tests
- CI with github actions 
  |React|Vue.js|Angular|
  |-----|------|-------|
  |![React CI](https://github.com/vtrifonov-esfiddle/aspnet-spa-starter/workflows/CI/badge.svg)|![CI](https://github.com/vtrifonov-esfiddle/aspnet-spa-starter/workflows/CI/badge.svg?branch=aspnet-vue-starter)|![CI](https://github.com/vtrifonov-esfiddle/aspnet-spa-starter/workflows/CI/badge.svg?branch=aspnet-angular-starter)|
- dev environment provides
  - watched run for ASP .Net and the SPA
  - watched run unit tests 
  - use `docker` & `docker-compose` CLI inside the dev container
  - dev container VS Code extensions
    - Docker
    - GitLens
    - C#
    - ESLint
  - VS Code launch profiles for debugging
  - VS Code tasks
    - run the app (watching for changes)
    - run xUnit tests (watching for changes)
    - run jest/karma unit tests (watching for changes)
    - run e2e tests (cypress)
- prod environment
  - docker build creates prod container
    - commit tagged with semantic versioning
    - image published as github package
  - CI runs on push to the main SPA branches
    - runs tests
    - builds prod container
    - pushes the container to github docker registry [aspnet-spa-starter](https://github.com/vtrifonov-esfiddle/aspnet-spa-starter/packages/229583)

## Try it on your Dev Machine

1. Install the prerequisites
    - [Docker for Desktop](https://www.docker.com/products/docker-desktop)
    - [Visual Studio Code](https://code.visualstudio.com/)
      - install extention [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
    - [git](https://git-scm.com/downloads)
2. Clone the repo
    ```
    git clone https://github.com/vtrifonov-esfiddle/aspnet-spa-starter.git
    ```
3. (Optional) pick spa branch
    - (default) react: `git checkout master`
    - vue.js: `git checkout aspnet-vue-starter`
    - angular: `git checkout aspnet-angular-starter`
3. Open the repo root directory in VS Code
4. Press F1 in VS Code
5. type `>Remote-Containers: Reopen in Container`
6. Press F5 in VS Code to start debugging
7. On your dev machine navigate to http://localhost:5000/

## Dev Containers

- VS Code starts the dev containers via `./devcontainer/devcontainer.json`
- `./devcontainer/docker-compose.yaml` orchestrates the dev containers
  - **aspnet-spa-starter** 
    - the main container where you develop locally with VS Code
    - use VS code as you would on your host machine with all dependencies installed
      - edit source code
      - build/debug/launch the app
      - run VS Code tasks
        - run xUnit tests
        - run jest/karma unit tests
        - run the app
      - npm install/uninstall etc.
      - push/pull changes to the the github repository
      - `docker` & `docker-compose` CLI connected to your host Docker instance
  - **spa-dev-server** - runs in isolated container the SPA HTTP dev server (a node process)
  - **e2e-tests-dev** - cypress container waiting for the developer for input commands
    - to run the tests use the VS Code task `e2e tests`

### Environment Variables

The following environment variables are available for `aspnet-spa-starter` container

- WORKSPACE_DIR_DOCKER_MOUNT 
  - this is the repository workspace root directory docker mount
  - e.g `/host_mnt/c/GithubRepos/aspnet-spa-starter`
  - necessary for bind mounts because you cannot start nested docker container from `aspnet-spa-starter` on non-linux host machine
    - [see bind mounts propagation](https://docs.docker.com/storage/bind-mounts/#configure-bind-propagation) 
- DOCKER_REGISTRY 
  - your github docker registry
  - allows you to tag/push/pull images to your docker registry without hardcoding it
    - you need to [login to the registry](#-Push/Pull-from-your-aspnet-spa-starter-Docker-Registry) to use it
  - e.g: `docker.pkg.github.com/vtrifonov-esfiddle/aspnet-spa-starter`
    - this matches `docker.pkg.github.com/${{ github.repository }}` from the github workflow `CI`
- GITHUB_USERNAME
  - your github username
- SPA_DEV_SERVER_URI 
  - the URI to `spa-dev-server` SPA HTTP dev server
  - ASP .NET proxies to SPA HTTP dev server via this URI
- REPO_ROOT_DIR
  - the top-level repo root dir for CI scripts
  - for the dev container this is `/app`
  - for github `CI` workflow this is [github.workspace](https://help.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#github-context)
  
  
## Push/Pull from your aspnet-spa-starter Docker Registry

To work locally with your docker registry you need read and write access. Performs the steps once you have generated your repo from the template

1. create `PAT` (personal access token) with the following permissions via https://github.com/settings/tokens
    - read:packages
    - repo, write:packages
2. on the dev container login to the registry using `PAT`
   - the username is provided via an environment variable available on the dev container
```
docker login docker.pkg.github.com -u $GITHUB_USERNAME
```