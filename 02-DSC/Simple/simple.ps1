configuration WebServer
{
    node ("Member1")
    {
        # Ressourcenanbieter aufrufen
        # Beispiel: WindowsFeature, File
        WindowsFeature WebServerRole
        {
           Ensure = "Present"
           Name   = "web-server"
        }
        WindowsFeature WebServerManagement
        {
            Ensure = "Present"
            Name   = "Web-Mgmt-Tools"
        }

        Service WWW-Dienst
        {
            Name = "w3svc"
            StartUpType = "Automatic"  
            DependsOn = "[WindowsFeature]WebServerRole" 
        }              
    }
}
#Ausführen der Konfiguration lädt diese in den Speicher

$Zielpfad = "C:\KursBeispiele\02-DSC\Simple"

#Anschließend können die MOF Dateien erzeugt werden
WebServer -OutputPath $Zielpfad

#Anwenden der MOF Dateien
Start-DscConfiguration -Wait -Verbose -Path $Zielpfad