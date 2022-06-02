Enum Antriebsart
{
    KeineAngabe
    Benzin
    Diesel
    Wasserstoff
    LPG
    CNG
    Elektrizität
    Hybrid = 10
}

class Fahrzeug
{
    [ValidateRange(1800,2022)]
    [int]$Baujahr

    [ValidateLength(2,30)]
    [string]$Hersteller
}

class Auto : Fahrzeug
{
    [ValidateRange(0,1000)]
    [int]$PS

    [ValidateRange(0,8)]
    [int]$AnzahlRäder

    [ValidateLength(2,30)]
    [string]$Modell

    [Antriebsart]$Antrieb

    [DateTime] hidden $CreationDate

    #Konstruktoren werden beim erstellen der Instanz der Klasse ausgeführt
    #Dieser Konstruktor wird verwendet wenn kein Wert übergeben wird
    Auto ()
    {
        $this.CreationDate = Get-Date
    }
    #Dieser Konstruktor wird verwendet wenn Hersteller angegeben wird
    Auto ([string]$Hersteller)
    {
        $this.CreationDate = Get-Date
        $this.Hersteller = $Hersteller
    }

    #Methoden brauchen einen Rückegabewert. Wenn keine Rückgabe / Ergebnis vorhanden ist [void]
    [string]Drive([int]$Distance)
    {
        [string]$strecke = "🚗-"
        for($i = 1; $i -le $Distance; $i++)
        {
            $strecke = "-" + $strecke
        }
        return $strecke
    }

    #Es können Standardmethoden auch überschrieben werden
    [string] ToString()
    {
        [string]$Ausgabe = $this.Hersteller + "(" + $this.Modell + ")"
        return $Ausgabe
    }
}

$bmw = [Auto]::new("BMW")
$bmw.Modell = "F31"
$bmw.PS = 252
$bmw.AnzahlRäder = 4
$bmw.Baujahr = 2017
$bmw.Antrieb = [Antriebsart]::Hybrid