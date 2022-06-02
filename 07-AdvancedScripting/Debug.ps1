[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
$Eingabe1,

[Parameter(Mandatory=$true)]
$Eingabe2
)

Write-Host -ForegroundColor Magenta -Object $Eingabe1

Write-Debug -Message "Zwischen den Ausgabe"

Write-Host -ForegroundColor Green -Object $Eingabe2