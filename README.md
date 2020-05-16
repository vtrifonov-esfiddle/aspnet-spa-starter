# aspnet-spa-starter

A starter template for development inside Docker containers with Visual Studio Code using
- tech stack
  - ASP .NET Core
  - SPA (React/Vue.js)
- CI with github actions 

![CI](https://github.com/vtrifonov-esfiddle/aspnet-spa-starter/workflows/CI/badge.svg)

## Prerequisites

- [Docker for Desktop](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)
  - VS Code extentions:
    - [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

## Getting started

Steps to start developing using Visual Studio Code

1. [Use this template](https://github.com/vtrifonov-esfiddle/aspnet-spa-starter/generate)
2. Clone the repo generated from the template locally
    ```
    git clone https://github.com/<your github username>/<your repo name>.git
    ```
3. Open the repo root directory in VS Code
4. Press F1 in VS Code
5. type `>Remote-Containers: Reopen in Container`
6. Press F5 in VS Code to start debugging
7. On your dev machine navigate to http://localhost:5000/

## Push/Pull from your aspnet-spa-starter Docker Registry

1. Create PAT(personal access token) with the following permissions via https://github.com/settings/tokens
    - read:packages
    - repo, write:packages
2. Login to the registry using your `<github username>` and `<PAT>`
```
docker login docker.pkg.github.com -u <github username> -p "<PAT>"
```