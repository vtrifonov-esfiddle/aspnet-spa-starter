#!/bin/bash
# GITHUB_USERNAME="${{ github.actor }}"
# PAT_TOKEN="${{ secrets.GithubDockerRegistryRead }}" - Github PAT with registry read access  

sudo kubectl apply secret docker-registry github-registry \
  --docker-server="docker.pkg.github.com" \
  --docker-username=$GITHUB_USERNAME \
  --docker-password=$PAT_TOKEN