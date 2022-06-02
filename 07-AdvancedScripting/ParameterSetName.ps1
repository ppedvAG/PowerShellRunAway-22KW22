[cmdletBinding(DefaultParameterSetName="Set1")]
param(
    [Parameter(ParameterSetName="Set1",Mandatory=$true)]
    $Äpfel,

    [Parameter(ParameterSetName="Set2")]
    $Birnen,

    [Parameter(ParameterSetName="Set1",Mandatory=$true)]
    [Parameter(ParameterSetName="Set2",Mandatory=$false)]
    $Flaschengröße
)
<#
Bei der Verwendung des ParameterSetName sollte auch im cmdletBinding der DefaultParameterSetName gesetzt werden wenn mit Mandatory gearbeitet wird,
das das System weiß welches Set es Standardmäßig verwenden soll wenn kein Parameter angegeben wurde
#>