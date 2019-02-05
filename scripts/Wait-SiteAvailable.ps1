[CmdletBinding()]
param (
  [string]
  $WebAppUrl = $env:webAppUrl,
  [int]
  $MaximumAttempts = 10,
  [int]
  $SecondsBetweenAttempts = 30
)

Write-Verbose "Waiting for $WebAppUrl to be available"
$attempts = 0
do {
  $attempts += 1
  Write-Verbose "Attempt $attempts calling $WebAppUrl"
  $statusCode = (Invoke-WebRequest -Uri $WebAppUrl -ErrorAction SilentlyContinue).StatusCode
  if ($statusCode -ne 200) {
    Write-Verbose "Received status code $statusCode. Sleeping for $SecondsBetweenAttempts seconds"
    Start-Sleep -Seconds $SecondsBetweenAttempts
  }
} until ($statusCode -eq 200 -or $attempts -eq $MaximumAttempts)

if ($statusCode -ne 200) {
  exit 1
}