[cmdletBinding()]
param(
[Parameter(Mandatory=$true,ValueFromPipeLine=$true,ValueFromPipeLineByPropertyName=$true)]
[string]$Name
)
Begin
{
    Write-Host -Object "Wird einmalig zum Start ausgeführt" -ForegroundColor Magenta
    #z.B.
    #zum aufbauen von RemoteVerbindungen
    #zum erzeugen von Credentials
    #zur Funktionsdeklaratio
}
Process
{#Wird für jedes übergebene Objekt ausgeführt

Write-Host -Object $Name -ForegroundColor Green

}
End
{
 Write-Host -Object "Wird einmalig zum Schluss ausgeführt" -ForegroundColor Magenta
 #z.B.
 #zum beeenden von RemoteVerbindungen
 #zum löschen von Credentials
 #freigeben von Ressourcen
}