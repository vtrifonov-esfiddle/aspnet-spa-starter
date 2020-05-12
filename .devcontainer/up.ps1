$IsMatched = $(Get-Content .env)[1] -match "GITHUB_REPO=(.+)"
$RepoName = $Matches[1]
$ProjectName = "$($RepoName)_devcontainer"
echo $ProjectName
docker-compose --project-name $ProjectName -f $PSScriptRoot\docker-compose.yml up -d --build