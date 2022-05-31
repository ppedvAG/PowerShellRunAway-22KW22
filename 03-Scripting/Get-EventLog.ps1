[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$ComputerName = "localhost"
)

Write-Verbose -Message "Ich werde bloß ausgegeben wenn das Skript mit -verbose aufgerufen wird, um mich verwenden zu können sollte [cmdletBinding]param() verwendet werden"
Write-Verbose -Message "Vom User wurde folgendes angegeben $EventID | $Newest | $ComputerName"


Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest
