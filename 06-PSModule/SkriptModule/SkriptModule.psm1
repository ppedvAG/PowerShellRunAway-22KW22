function New-TestFilesDir
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem -PathType Container})]
    [string]$DestinationPath,

    [ValidateRange(1,20)]
    [int]$FileCount = 9,

    [ValidateRange(1,20)]
    [int]$DirCount = 2,

    [Validatelength(3,15)]
    [string]$DirName = "Testfiles",

    [switch]$force
)

#Beispiel für Bereinigung der Pfad eingabe
[string]$TestDirPath
if($DestinationPath.EndsWith("\"))
{#wenn pfad auf \ endet
    $TestDirPath = $DestinationPath + $DirName
}
else
{#wenn Pfad nicht auf \ endet
    $TestDirPath = $DestinationPath + "\" + $DirName
}

#Prüfen ob das Verzeichnis vorhanden ist
if(Test-Path -Path  $TestDirPath -PathType Container)
{
    if($force)
    {#wenn das Verzeichnis vorhanden ist und force angegeben wurde soll das Verzeichnis gelöscht werden
        Remove-Item -Path $TestDirPath -Recurse -Force
    }
    else
    {#wenn das Verzeichnis vorhanden ist und kein force angegeben wurde, textausgabe und beenden
        Write-Host -Object "Ordner bereits vorhanden" -ForegroundColor Red
        exit
    }
}

#erstellen des TestDir Verzeichnisses und speichern des Directory Objekts in einer Variable zu wiederverwendung
$TestDir = New-Item -Path $DestinationPath -Name $DirName -ItemType Directory

#erzeugen der Dateien im Root Verzeichniss
New-TestFiles -Destinationpath $TestDir.FullName -FileCount $FileCount 

#erzeugen der Unterordner im Root Verzeichniss
for($i = 1; $i -le $DirCount; $i++)
{
    $dirnumber = "{0:D3}" -f $i
    $dirname = "Dir" + $dirnumber
    $subdir = New-Item -Path $TestDir.FullName -Name $dirname -ItemType Directory

    #erzeugen der Dateien im Unterordner
    $filename = "D" + $dirnumber + "File"
    New-TestFiles -Destinationpath $subdir.FullName -FileCount $FileCount -FileBaseName $filename

}
}

function New-TestFiles
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$Destinationpath,
    
    [ValidateRange(1,20)]
    [int]$FileCount = 9,

    [ValidateLength(3,20)]
    [string]$FileBaseName = "File"

)
for($i = 1; $i -le $FileCount; $i++)
{
    $filenumber = "{0:D3}" -f $i
    $filename = $FileBaseName + $filenumber + ".txt"
    New-Item -Path $Destinationpath -Name $filename -ItemType File
}

}