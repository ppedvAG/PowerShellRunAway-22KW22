@{
 AllNodes = @(
 @{
    NodeName = "Member1"
    WindowsFeatures = @(
    @{
           Ensure = "Present"
           Name   = "web-server"
     },
    @{
           Ensure = "Present"
           Name   = "Web-Mgmt-Tools"        
      }
    )
 }
 )
}