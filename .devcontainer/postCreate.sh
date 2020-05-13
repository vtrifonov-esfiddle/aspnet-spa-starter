echo "WORKSPACE_DIR_DOCKER_MOUNT=$(docker inspect -f '{{range .Mounts }}{{ if eq .Destination "/app" }}{{.Source}}{{end}}{{end}}' aspnet-react-container.dev)" >> ~/.bashrc

OriginUrl=$(git config --get remote.origin.url)
OriginUrlRegexPattern="https:\/\/github.com\/(.+)\/(.+)\.git"
[[ $OriginUrl =~ $OriginUrlRegexPattern ]] 

GithubUsername=${BASH_REMATCH[1]}
GithubRepo=${BASH_REMATCH[2]}
echo "GITHUB_USERNAME=$GithubUsername" >> ~/.bashrc
echo "DOCKER_REGISTRY=docker.pkg.github.com/$GithubUsername/$GithubRepo" >> ~/.bashrc