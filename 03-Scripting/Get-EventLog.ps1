<#
.SYNOPSIS 
Kurzbeschreibung: Abfrage von User Session bezogenen Events
.DESCRIPTION
Lange Beschreibung was das Skript genau macht. 
.PARAMETER EventID
Dieser Parameter definiert welche Art von Event abgefragt wird. Mögliche Werte sind:
4624 : Anmeldung
4625 : fehlgeschlagene Anmeldung
4634 : Abmeldung
.EXAMPLE

Get-EventLog.ps1 -EventId 4624

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   30285 Mai 31 11:31  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   30282 Mai 31 11:30  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   30277 Mai 31 11:29  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   30274 Mai 31 11:29  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   30270 Mai 31 11:29  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
.LINK
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#syntax-for-comment-based-help-in-scripts
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId,

[ValidateRange(5,10)]
[int]$Newest = 5,

[ValidateScript({Test-NetConnection -ComputerName $PSItem -CommonTcpPort WinRM})]
[string]$ComputerName = "localhost",

[ValidatePattern("[a-z]{3}[0-9]{3}[.](csv)")]
[string]$FileName = "NoInput"
)

Write-Verbose -Message "Ich werde bloß ausgegeben wenn das Skript mit -verbose aufgerufen wird, um mich verwenden zu können sollte [cmdletBinding]param() verwendet werden"
Write-Verbose -Message "Vom User wurde folgendes angegeben $EventID | $Newest | $ComputerName"


$Ergebnis = Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest

if($FileName -eq "NoInput")
{
    $Ergebnis
}
else
{
    Export-Csv -InputObject $Ergebnis -Path $FileName
}
