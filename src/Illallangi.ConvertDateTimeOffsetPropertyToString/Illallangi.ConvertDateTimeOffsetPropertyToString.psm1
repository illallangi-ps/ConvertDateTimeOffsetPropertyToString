function Convert-DateTimeOffsetPropertyToString
{
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [PSCustomObject]$InputObject
    )

    PROCESS
    {
        foreach ($p in $InputObject.PSObject.Properties |?{ $_.TypeNameOfValue -eq "System.DateTimeOffset" })
        {
            $InputObject.$($p.Name) = $p.Value.ToString("yyyy-MM-ddTHH:mm:ssK", [System.Globalization.CultureInfo]::InvariantCulture)
        }

        $InputObject
    }
}