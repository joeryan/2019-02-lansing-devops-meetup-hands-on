[CmdletBinding()]
param (
  [string]
  $WebAppUrl = $env:webAppUrl,
  [int]
  $MaximumAttempts = 10,
  [int]
  $SecondsBetweenAttempts = 30
)

$attempts = 0
do {
  $attempts += 1
  $statusCode = (Invoke-WebRequest -Uri $WebAppUrl).StatusCode
  if ($statusCode -ne 200) {
    Start-Sleep -Seconds $SecondsBetweenAttempts
  }
} until ($statusCode -eq 200 -or $attempts -eq $MaximumAttempts)