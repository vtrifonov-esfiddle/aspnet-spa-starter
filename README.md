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
- dev environment
  - watched run for ASP .Net and the SPA
  - watched run unit tests 
  - use docker & docker-compose CLI inside the dev container
  - dev container VS Code extensions
    - Docker
    - GitLens
    - C#
    - ESLint
  - VS Code launch profiles for debugging
  - VS Code tasks
    - watched run
    - run SPA tests (watched)
    - run xUnit tests (watched)
    - run e2e tests
- prod environment
  - docker build creates prod container
  - CI runs on push to the main SPA branches
    - runs tests
    - builds prod container
    - pushes the container to github docker registry [aspnet-spa-starter](https://github.com/vtrifonov-esfiddle/aspnet-spa-starter/packages/229583)
## Prerequisites

- [Docker for Desktop](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)
  - VS Code extentions:
    - [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

## Try it on your Dev Machine

Steps to start developing using Visual Studio Code

1. Install the prerequisites
2. Clone the repo
    ```
    git clone https://github.com/vtrifonov-esfiddle/aspnet-spa-starter.git
    ```
3. Open the repo root directory in VS Code
4. Press F1 in VS Code
5. type `>Remote-Containers: Reopen in Container`
6. Press F5 in VS Code to start debugging
7. On your dev machine navigate to http://localhost:5000/

## Push/Pull from your aspnet-spa-starter Docker Registry

Performs the steps once you have generated your repo from the template

1. Create PAT(personal access token) with the following permissions via https://github.com/settings/tokens
    - read:packages
    - repo, write:packages
2. Login to the registry using your `<github username>` and `<PAT>`
```
docker login docker.pkg.github.com -u <github username> -p "<PAT>"
```