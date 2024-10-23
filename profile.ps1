set-psreadlineoption -Colors @{ "InlinePrediction" = "`e[38;5;238m" }
$PSStyle.Formatting.CustomTableHeaderLabel = "`e[32;1m"

function Invoke-Tere {
    $result = . (Get-Command -CommandType Application tere) $args
    if ($result) {
        Set-Location $result
    }
}
Set-Alias tere Invoke-Tere

function PrettyPrint-Json {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $json
    )
    $json | ConvertFrom-Json | ConvertTo-Json -Depth 100
}
