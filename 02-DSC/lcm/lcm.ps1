Configuration WebServerConfiguration
{
    Node $AllNodes.NodeName
    {
        LocalConfigurationManager
        {
            #Mögliche Werte:
            #ApplyOnly (Default)
            #ApplyAndMonitor | Wendet die Konfig an und Monitort Änderungen
            #ApplyAndAutoCorrect | Wendet Konfig an und probiert den Sollzustand zu halten
            ConfigurationMode = "ApplyAndAutoCorrect"

            #Anzahl an Minuten als Abstand in denen geprüft wird. Gestartet wird ab Start des Server/PC
            #Defaul und Min Wert sind 15 Minuten
            ConfigurationModeFrequencyMins = 15
        }

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

$Zielpfad = "C:\KursBeispiele\02-DSC\lcm"

#Anschließend können die MOF Dateien erzeugt werden
WebServerConfiguration -OutputPath $Zielpfad -ConfigurationData "$Zielpfad\lcm.psd1"

#Anwenden der MOF Dateien
Start-DscConfiguration -Wait -Verbose -Path $Zielpfad