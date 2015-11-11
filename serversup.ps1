$servers = "10.10.241.11","10.10.241.21","10.10.241.22", "10.10.241.23", "10.10.241.24", "10.10.241.25", "10.10.241.26", "10.10.241.101", "10.10.241.102","10.10.241.103", "10.10.241.104", "10.10.241.151", "10.10.241.152", "10.10.241.153", "10.10.241.154", "10.10.241.176", "10.10.241.201", "10.10.241.205", "10.10.241.210"
$collection = $()
foreach ($server in $servers)
{
    $status = @{ "ServerName" = $server; "TimeStamp" = (Get-Date -f s) }
    if (Test-Connection $server -Count 1 -ea 0 -Quiet)
    { 
        $status["Results"] = "Up"
    } 
    else 
    { 
        $status["Results"] = "Down" 
    }
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $collection += $serverStatus

}
$collection #| Export-Csv -LiteralPath .\ServerStatus.csv -NoTypeInformation