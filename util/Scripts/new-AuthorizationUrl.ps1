param(
    [Parameter(Mandatory = $true)][string]$SettingsFilePath
)

function Generate-UniqueState {
    return -join ((48..57) + (65..90) + (97..122) | Get-Random -Count 32 | % { [char]$_ })
}

$settings = Get-Content -Path $SettingsFilePath | ConvertFrom-Json
$clientId = $settings.APP_CLIENTID
$redirectUri = $settings.APP_REDIRECT_URI

$state = Generate-UniqueState
$scope = "r_liteprofile%20r_emailaddress%20w_member_social"

$authorizationUrl = "https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=$clientId&redirect_uri=$redirectUri&state=$state&scope=$scope"

return $authorizationUrl
