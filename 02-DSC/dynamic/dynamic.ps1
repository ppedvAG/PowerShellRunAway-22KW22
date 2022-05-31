Configuration WebServerConfiguration
{
    Node $AllNodes.NodeName
    {
        Foreach($Feature in $Node.WindowsFeatures)
        {
        WindowsFeature $Feature.Name
        {
            Name = $Feature.Name
            Ensure = $Feature.Ensure
        }
        }
    }
}

#Ausführen der Konfiguration lädt diese in den Speicher

$Zielpfad = "C:\KursBeispiele\02-DSC\dynamic"

#Anschließend können die MOF Dateien erzeugt werden
WebServerConfiguration -OutputPath $Zielpfad -ConfigurationData "$Zielpfad\dynamic.psd1"

#Anwenden der MOF Dateien
Start-DscConfiguration -Wait -Verbose -Path $Zielpfad