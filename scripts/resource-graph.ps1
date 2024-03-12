#requires -Module Az.ResourceGraph
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateScript({
        if (Test-Path -PathType Leaf $_) {
            $true
        } else {
            throw "File path `$_` does not exist."
        }
    })]
    [string]
    $Path
)

$query = Get-Content -Path $Path -Raw

Search-AzGraph -Query $query