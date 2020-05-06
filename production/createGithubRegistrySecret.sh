#!/bin/bash
# GITHUB_USERNAME="${{ github.actor }}"
# PAT_TOKEN="${{ secrets.GithubDockerRegistryRead }}" - Github PAT with registry read access  

sudo kubectl delete secret github-registry --ignore-not-found=true
sudo kubectl create secret docker-registry github-registry \
  --docker-server="docker.pkg.github.com" \
  --docker-username=$GITHUB_USERNAME \
  --docker-password=$PAT_TOKEN