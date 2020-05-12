$OriginUrl = git config --get remote.origin.url 
$IsMatched = $OriginUrl -match "https:\/\/github.com\/(.+)\/(.+)\.git"

$GithubUsername = $Matches[1]
$GithubRepoName = $Matches[2]

Set-Content -Path .env "GITHUB_USERNAME=$GithubUsername"
Add-Content -Path .env "GITHUB_REPO=$GithubRepoName"

Write-Host "devcontainer will use:"
Get-Content .env