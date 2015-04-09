###############################################################################
## This script will rename the ethernet adapters to a more descriptive name  ##
##  There is also a block to change the IP addresses of anything that got    ## 
##  fat-fingered when initially set up.                                      ##
##                                                                           ##
##   Eventually this will be replaced with a DSC setup.                      ##
###############################################################################

[string]$lastoctet = 104
$CAM1adp = "Ethernet 3"
$CAM2adp = "Ethernet"
$CAM3adp = "Ethernet 2"
$LANadp =  "Ethernet 4"
[string]$cam1 = "172.22.20"
[string]$cam2 = "172.22.24"
[string]$cam3 = "10.3.244"
[string] $lan = "10.3.241"
$cam1name = "CAM1--" + $cam1 + "." + $lastoctet
$cam2name = "CAM2--" + $cam2 + "." + $lastoctet
$cam3name = "CAM3--" + $cam3 + "." + $lastoctet
$lanname = "LAN--" + $lan + "." + $lastoctet
$cam1fullip = $cam1+"."+$lastoctet
$cam2fullip = $cam2+"."+$lastoctet
Get-NetAdapter -Name $CAM1adp | Rename-NetAdapter -NewName $cam1name
Get-NetAdapter -Name $CAM2adp | Rename-NetAdapter -NewName $cam2name
Get-NetAdapter -Name $CAM3adp | Rename-NetAdapter -NewName $cam3name
Get-NetAdapter -Name $LANadp | Rename-NetAdapter -NewName $lanname
get-netadapter $cam1name | New-NetIPAddress -IPAddress $cam1fullip -PrefixLength 22
get-netadapter $cam2name | New-NetIPAddress -IPAddress $cam2fullip -PrefixLength 22
$badaddress1 = "10.22.20." + $lastoctet 
$badaddress2 = "10.22.24." + $lastoctet
$badaddress3 = "10.20.22." + $lastoctet
$badaddress4 = "10.20.24." + $lastoctet
Remove-NetIPAddress -IPAddress $badaddress1 -Confirm:$False
Remove-NetIPAddress -IPAddress $badaddress2 -Confirm:$False
Remove-NetIPAddress -IPAddress $badaddress3 -Confirm:$False
Remove-NetIPAddress -IPAddress $badaddress4 -Confirm:$False
echo "script complete"
