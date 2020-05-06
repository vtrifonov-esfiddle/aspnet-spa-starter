#!/bin/bash
# GITHUB_USERNAME="${{ github.actor }}"
# PAT_TOKEN="${{ secrets.GITHUB_TOKEN }}"

sudo kubectl create secret docker-registry github-registry \
  --docker-server="docker.pkg.github.com" \
  --docker-username=$GITHUB_USERNAME \
  --docker-password=$PAT_TOKEN