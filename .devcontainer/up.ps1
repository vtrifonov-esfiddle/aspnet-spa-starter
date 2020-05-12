$OriginUrl = git config --get remote.origin.url 
$IsMatched = $OriginUrl -match "https:\/\/github.com\/(.+)\/(.+)\.git" 

$GithubUsername = $Matches[1]
$GithubRepo = $Matches[2]

Write-Host "Github Username: $GithubUsername"
Write-Host "Github Repo: $GithubRepo"

Set-Content -Path "$PSScriptRoot\.env" "GITHUB_USERNAME=$GithubUsername"
Add-Content -Path "$PSScriptRoot\.env" "GITHUB_REPO=$GithubRepo"
$ProjectName = "$($GithubRepo)_devcontainer"

docker-compose --project-name $ProjectName `
    -f $PSScriptRoot\docker-compose.yml `
    up `
    -d --build