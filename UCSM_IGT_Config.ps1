#-------------------------------------------------------------------------------------------------------------------------------
#
#UCS Configuration Script
#Cobbled together by Damon Chance
#None of this is my own work... I got it all from the Googles
#
#Version 2.1
#---------------------------------------------------------------------------------------------------------------------------------
################################################################################################################################
### VARS  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################################################################
#Fake iSCSI Initiator pool variables
$DefaultiSCSIPoolDefGW  = "1.1.1.1"
$DefaultiSCSIPrimDNS    = "1.1.1.2"
$DefaultiSCSISecDNS     = "1.1.1.3"
$DefaultiSCSIPoolFrom   = "1.1.1.4"
$DefaultiSCSIPoolTo     = "1.1.1.4"
$DefaultiSCSIPoolSubnet = "255.255.255.0"


## Management Pool (This is systems management information)
#Default Gateway IP Address for UCSM Management
# Example: $DefGw = "9.9.9.1"
$DefGw = ""

## Primary DNS IP Address for UCSM Management
# Example: $PriDNS = "9.9.9.10"
$PriDNS = "1"

## Secondary DNS IP Address for UCSM Management
# Example: $SecDNS = "9.9.9.11"
$SecDNS = ""

## First IP Address in Blade Management Pool. (Must be on the same subnet as UCSM's management IP's)
# Example: $MgmtIPstart = "9.9.9.21"
$MgmtIPstart = ""

## Last IP Address in Blade Management Pool. (Must be on the same subnet as UCSM's management IP's)
# Example: $MgmtIPend = "9.9.9.254"
$MgmtIPend = ""

## Management Info
# Example: $UCSDesc = "UCS system in my lab"
#Max: 256 Characters
$UCSDesc      = "UCSM"
# Example: $UCSOwner = "John Smith"
#Max: 32 Characters
$UCSOwner     = "SysAdmins"
# Example: $UCSSite = "Datacenter 12 - anytown - Country"
#Max: 32 Characters
$UCSSite      = ""
# Example: $UCSDNSDomain = "domain.com"
#Max: 256 Characters
$UCSDNSDomain = ""
# Example: $SystemName = "MyUCS".  If left with just "" then the script will not change the default name assigned at startup
#Max: 30 Characters
$SystemName   = ""

## Timezone Management
#Must be full description such as "America/Los_Angeles (Pacific Time)".  You may have to log into a UCS system to find out the proper format for your timezone.
# Example: $Timezone = "America/Los_Angeles (Pacific Time)"
$Timezone = "America/Chicago (Central Time)"

##NTP Servers
# Example: $NTPName = @("4.4.4.4", "5.5.5.5")
#Max: 64 Characters. IP Address or host.domain
$NTPName = @("", "")

## Important default variables and values
#Default Scub Policy
#Options: No_Scrub, BIOS_Scrub, Disk_Scrub, Full_Scrub
$DefaultScrub = "No_Scrub"
#Default User Acknowledgement of new Chassis and Rack Servers
#Options: user-acknowledged, immediate
$DefaultRackServerDiscovery = "immediate"
#Default Rack Management Connectcion Policy
#Options: user-acknowledged, auto-acknowledged
$DefaultRackManagement = "auto-acknowledged"
#Default Chassis/FEX Discovery - Action
#Options: 1-link, 2-link, 4-link, 8-link, platform-max
$DefaultDiscoveryAction = "4-link"
#Default Chassis/FEX Discovery - Link Grouping Preference
#Options: none, port-channel
$DefaultLinkGrouping = "port-channel"
#Default Power Control
#Options: default, No_Cap
$DefaultPowerControl = "No_Cap"
#Default Serial over LAN
#Options: No_SoL, SoL_9600, SoL_19200, SoL_38400, SoL_57600, SoL_115200
$DefaultSoL = "No_SoL"
#Default LAN Connectivity
#Options: Create your own logical name
$DefaultLANConnectivity = "IGT-Connectivity"
#Options: Create your own logical name
$DefaultLANwiSCSIConnectivity = "vNICs_iSCSI"
#Default LAN Adapter Policy
#Options: "", Linux, SRIOV, Solaris, VMWare, VMWarePassThru, Windows, default
$DefaultLANAdapter = "VMware"
#Default vSAN Names
#Options: Create your own logical name and _A or _B will be appended to the end. ie vSAN_A and vSAN_B
$DefaultvSANName = "vSAN"
#Default HBA Connectivity
#Options: Create your own logical name
$DefaultHBAConnectivity = "vHBAs"
#Default SAN WWPN Pool Names
#Options: Create your own logical name and _A or _B will be appended to the end. ie Fabric_A and Fabric_B
$DefaultWWPNPool = "Fabric"
## Identify whether the system being accessed is an emulator or real system.
#If running against emulator "y", if running against a real UCS "n"
#By turning this on, the system will not re-ack the chassis' or FEX's which will cause the emulator to fail.  It will also not configure any server ports as this also causes the emulator to fail
$UCSEmulator = "n"

## Global QoS Settings and QoS Policies
#Select the global QoS settings to enable and their values
#Enabled - "y" or "n"
#CoS - 0 - 6
#Packet Drop - "drop" or "no-drop".  Only have one custom set to support packet drop
#Weight - none=(0), best-effort=(1), 2 - 10
#MTU - normal, fc, 1500 - 9216
#Multicast Optimized - "yes" or "no".  Only have one policy set to support multicast optimized
#
#Select the QoS Policy settings to enable and their values
#Burst - 1 - 65535
#Rate - line-rate or 1 - 9999999
#Host Control - none or full
#
######-Burst 10240 -HostControl "none" -Name "" -Prio "fc" -Rate "line-rate"
#Fibre Channel Global Defaults: Enabled=y(Always),	CoS=3,			Packet Drop=no-drop(Always),		Weight=5,		MTU=fc(Always),	Multicast Optimized=N/A(Always)
#Fibre Channel LAN Policy Defaults: 	Burst=10240, Rate="line-rate", HostControl = "none"
$FibreChannelQoSCoS 		   = "3"
$FibreChannelQoSWeight 		   = "5"
$FibreChannelQoSBurst		   = "10240"
$FibreChannelQoSRate		   = "line-rate"
$FibreChannelQoSHostControl	   = "none"
#Best Effort Global Defaults:   Enabled=yes(Always),	CoS=any(Always), 	Packet Drop=drop(Always),		Weight=5,		MTU=normal,     	Multicast Optimized=no
#BestEffort LAN Policy Defaults: 		Burst=10240, Rate="line-rate", HostControl = "none"
$BestEffortQoSWeight 		   = "5"
$BestEffortQoSMTU 			   = "normal"
$BestEffortQoSMulticastOptimized = "no"
$BestEffortQoSBurst		        = "10240"
$BestEffortQoSRate		        = "line-rate"
$BestEffortQoSHostControl	   = "none"
#Bronze Global Defaults: 		Enabled=no,		CoS=1,			Packet Drop=drop,				Weight=7,		MTU=normal, 	   	Multicast Optimized=no
#Bronze LAN Policy Defaults: 			Burst=10240, Rate="line-rate", HostControl = "none"
$BronzeQoSEnabled 		        = "y"
$BronzeQoSCoS 			        = "1"
$BronzeQoSPacketDrop 		   = "drop"
$BronzeQoSWeight 		        = "7"
$BronzeQoSMTU 			   	   = "9128"
$BronzeQoSMulticastOptimized     = "no"
$BronzeQoSBurst		        = "10240"
$BronzeQoSRate		        	   = "line-rate"
$BronzeQoSHostControl	        = "none"
#Silver Global Defaults: 		Enabled=no,		CoS=2,			Packet Drop=drop,				Weight=8,		MTU=normal, 		Multicast Optimized=no
#Silver LAN Policy Defaults: 			Burst=10240, Rate="line-rate", HostControl = "none"
$SilverQoSEnabled 		        = "y"
$SilverQoSCoS 			        = "2"
$SilverQoSPacketDrop 		   = "drop"
$SilverQoSWeight 		        = "8"
$SilverQoSMTU 			   	   = "9128"
$SilverQoSMulticastOptimized     = "no"
$SilverQoSBurst		        = "10240"
$SilverQoSRate		        	   = "line-rate"
$SilverQoSHostControl	        = "none"
#Gold Global Defaults: 			Enabled=no,			CoS=4,			Packet Drop=drop,			Weight=9,		MTU=normal, 		Multicast Optimized=no
#Gold LAN Policy Defaults: 			Burst=10240, Rate="line-rate", HostControl = "none"
$GoldQoSEnabled 		        = "y"
$GoldQoSCoS 			        = "4"
$GoldQoSPacketDrop 		        = "drop"
$GoldQoSWeight 		        = "9"
$GoldQoSMTU 			   	   = "9128"
$GoldQoSMulticastOptimized       = "no"
$GoldQoSBurst		       	   = "10240"
$GoldQoSRate		        	   = "line-rate"
$GoldQoSHostControl	      	   = "none"
#Platinum Global Defaults: 		Enabled=no,			CoS=5,			Packet Drop=no-drop,		Weight=10,	MTU=normal, 		Multicast Optimized=no
#Platinum LAN Policy Defaults: 		Burst=10240, Rate="line-rate", HostControl = "none"
$PlatinumQoSEnabled 		   = "y"
$PlatinumQoSCoS 			   = "5"
$PlatinumQoSPacketDrop 		   = "no-drop"
$PlatinumQoSWeight 		        = "10"
$PlatinumQoSMTU 			   = "9128"
$PlatinumQoSMulticastOptimized   = "no"
$PlatinumQoSBurst		        = "10240"
$PlatinumQoSRate		        = "line-rate"
$PlatinumQoSHostControl	        = "none"

## UCS System IP or Host Name (VIP address for UCS Management)
# Example: $myucs = "9.9.9.9"
$myucs = ""

## UCS Domain Number (Unique 16 bit Hex number to identify this UCS system as unique among other systems in the organization)
#This element is used to create the UUID, MAC, WWPNs and WWNNs addresses
#Info: MAC Addresses - 00:25:B4:XX:C1:00 - FF = Where XX = UCS Domain
#Info: UUID Suffixs - 00XX- = Where XX = UCS Domain
#Info: WWPN/WWNNs - 20:00:00:25:B5:XX:AA:00 - FF = Where XX = UCS Domain
#Info: IQN Suffix - UCSXX = Where XX = UCS Domain
#While UCSDomain is not a real UCS parameter is it used to ensure that addresses are not overlapped in the environment
# Example: $UCSDomain = "01"
#Max: 2 digit number
$UCSDomain = "21"

## Boot Policy
#Set ("y" or "n") for each boot from option to determine how blades will boot.  Can select multiple for yes(y) or no(n).
# Example: $BootFromSAN = "y" or "n"
$BootFromHD = "y"
$BootFromSAN = "n"
$BootFromiSCSI = "n"

## Chassis Power Policy
# Example: $ChassisPower = "grid" or "n+1"
$ChassisPower = "n+1"

## Server Ports (Add or remove ports as needed.  Make sure to update last line with new QTY)
# Example: $ServerPort1 = @{Port = "1";	Slot = "1"; LabelA = "Chassis1A"; LabelB = "Chassis1B" }
#The use of Labels has not proven to be completely reliable in UCS.  Use at your own risk
#Labels Max: 16 Characters
$ServerPort1 = @{Port = "1";	Slot = "1"; LabelA = "Chassis1A"; LabelB = "Chassis1B" }
$ServerPort2 = @{Port = "2";	Slot = "1"; LabelA = "Chassis1A"; LabelB = "Chassis1B" }
$ServerPort3 = @{Port = "3";	Slot = "1"; LabelA = "Chassis1A"; LabelB = "Chassis1B" }
$ServerPort4 = @{Port = "4";	Slot = "1"; LabelA = "Chassis1A"; LabelB = "Chassis1B" }
#Make sure to match the entries in the array to the hash table
$ServerPort = @($ServerPort1, $ServerPort2, $ServerPort3, $ServerPort4)

## Uplink Ports(Add or remove ports as needed.  Make sure to update last line with new QTY)
# Example: $UplinkPort1 = @{Port = "32";  Slot = "1"; LabelA = "Nexus1-1-6"; LabelB = Nexus2-1-6" }
#The use of Labels has not proven to be completely reliable in UCS.  Use at your own risk
#Labels Max: 16 Characters
$UplinkPort1 = @{Port = "17";	Slot = "1"; LabelA = "Core1"; LabelB = "Core1" }
$UplinkPort2 = @{Port = "18";	Slot = "1"; LabelA = "Core2"; LabelB = "Core2" }
#Make sure to match the entries in the array to the hash table
$UplinkPort = @($UplinkPort1, $UplinkPort2)

##LAN Port Channels
#If using LAN Port Channels, set the value to "y"
#Value: y or n
$LANPortChannels       = "y"
#Fabric A LAN Port Channel Name
#Max: 16 Characters
$LANPortChannelAName   = "Uplink_to_4500x"
#Fabric A LAN Port Channel Number
#Range: 1 - 256
$LANPortChannelANumber = "13"
#Fabric B LAN Port Channel Name
#Max: 16 Characters
$LANPortChannelBName   = "Uplink_to_4500x"
#Fabric B LAN Port Channel Number
#Range: 1 - 256
$LANPortChannelBNumber = "14"


#UUID Suffix
#Default: $UUIDfrom = "00"+$UCSDomain+"-000000000000"
#Default: $UUIDto   = "00"+$UCSDomain+"-0000000000FF"
$UUIDfrom = "00"+$UCSDomain+"-000000000000"
$UUIDto   = "00"+$UCSDomain+"-0000000000FF"

#MAC Pools
#Default: $MACfrom = "00:25:B5:"+$UCSDomain+":ID:00"
#Default: $MACto   = "00:25:B5:"+$UCSDomain+":ID:FF"
#ID will be replaced in the script with the value from $networkcount["macid"]
$MACafrom = "00:25:B5:"+$UCSDomain+":AA:00"
$MACato   = "00:25:B5:"+$UCSDomain+":AA:7F"
$MACbfrom = "00:25:B5:"+$UCSDomain+":BB:00"
$MACbto   = "00:25:B5:"+$UCSDomain+":BB:7F"


######################################################################################################################################################
######################################################################################################################################################
#Log into the UCS System
$multilogin = Set-UcsPowerToolConfiguration -SupportMultipleDefaultUcs $false
Write-Host ""
Write-Host -ForegroundColor DarkBlue "Logging into UCS"
Write-Host -ForegroundColor DarkCyan "	Enter your UCSM credentials"
#Verify PowerShell Version to pick prompt type
$PSVersion = $psversiontable.psversion
$PSMinimum = $PSVersion.Major
if ($PSMinimum -ge "3")
	{
		$cred = Get-Credential -Message "UCSM Login Credentials" -UserName "admin"
	}
else
	{
		$cred = Get-Credential
	}
$myCon = Connect-Ucs $myucs -Credential $cred
if (($myucs | Measure-Object).count -ne ($myCon | Measure-Object).count) 
	{
		#Exit Script
		Write-Host -ForegroundColor Red "     Error Logging into UCS....Exiting"
		Disconnect-Ucs
		exit
	}
else
	{
		Write-Host -ForegroundColor DarkGreen "     Login Successful"
	}

#Make sure the user is positive that this is the system they want to modify/build
$UCSMajorVersion = $myCon.Version.Major
$UCSMinorVersion = $myCon.Version.Minor
$TopSystem=Get-UcsTopSystem -Address $myucs
$CurrentSystemName = $TopSystem.Name
$CurrentSystemIP = $TopSystem.Address
$CurrentSystemDesc = $TopSystem.Descr
$CurrentSystemOwner = $TopSystem.Owner
$CurrentSystemSite = $TopSystem.Site
Write-Host ""
Write-Host -ForegroundColor gray "You are logged into a UCS system with:"
Write-Host -ForegroundColor gray "	IP/Host:		" -NoNewline
Write-Host -ForegroundColor White -BackgroundColor DarkBlue $CurrentSystemIP
Write-Host -ForegroundColor yellow "	Name: 		" -NoNewline
Write-Host -ForegroundColor White -BackgroundColor DarkBlue $CurrentSystemName
Write-Host -ForegroundColor yellow "	Site: 		" -NoNewline
Write-Host -ForegroundColor White -BackgroundColor DarkBlue $CurrentSystemSite
Write-Host -ForegroundColor yellow "	Owner: 		" -NoNewline
Write-Host -ForegroundColor White -BackgroundColor DarkBlue $CurrentSystemOwner
Write-Host -ForegroundColor yellow "	Description: 	" -NoNewline
Write-Host -ForegroundColor White -BackgroundColor DarkBlue $CurrentSystemDesc
Write-Host ""
Write-Host -ForegroundColor yellow "Are you sure you want to continue (Y/N)"
$AreYouSure = $null
$AreYouSure = Read-Host "Are you sure you want to continue (Y/N)"
if ($AreYouSure -ine "Y")
	{
		Write-Host -ForegroundColor yellow "You have choosen to exit"
		Write-Host -ForegroundColor yellow "	Exiting..."
		Disconnect-Ucs
		exit
	}

#Test for single FI
$IsRedundantFI = Get-UcsFiModule | where {$_.Dn -eq "sys/switch-B/slot-1"}

######################################################################################################################################################
### Remove Defaults ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
######################################################################################################################################################
	
#remove default pools - From real systems and the emulator
Write-Host ""
Write-Host -ForegroundColor DarkBlue "Removing UCS defaults"
Get-UcsOrg -Level root | Get-UcsServerPool -Name "blade-pool-2" -LimitScope | Remove-UcsServerPool -force
Get-UcsOrg -Level root | Get-UcsServerPool -Name "default" -LimitScope | Remove-UcsServerPool -force

Get-UcsOrg -Level root | Get-UcsIpPool -Name "ip-pool-1" -LimitScope | Remove-UcsIpPool -force

Get-UcsOrg -Level root | Get-UcsIqnPoolPool -Name "default" -LimitScope | Remove-UcsIqnPoolPool -force

Get-UcsOrg -Level root | Get-UcsUuidSuffixPool -Name "default" -LimitScope | Remove-UcsUuidSuffixPool -force

Get-UcsOrg -Level root | Get-UcsMacPool -Name "mac-pool-1" -LimitScope | Remove-UcsMacPool -force
Get-UcsOrg -Level root | Get-UcsMacPool -Name "default" -LimitScope | Remove-UcsMacPool -force

Get-UcsOrg -Level root | Get-UcsIqnPoolPool -Name "default" -LimitScope | Remove-UcsIqnPoolPool

Get-UcsOrg -Level root | Get-UcsWwnPool -Name "node-default" -LimitScope | Remove-UcsWwnPool -force
Get-UcsOrg -Level root | Get-UcsWwnPool -Name "default" -LimitScope | Remove-UcsWwnPool -force

Get-UcsOrg -Level root | Get-UcsLocalDiskConfigPolicy -Name "default" -LimitScope | Remove-UcsLocalDiskConfigPolicy -force

Get-UcsOrg -Level root | Get-UcsScrubPolicy -Name "default" -LimitScope | Remove-UcsScrubPolicy -force

Get-UcsOrg -Level root | Get-UcsServerPoolQualification -Name "all-chassis" -LimitScope | Remove-UcsServerPoolQualification  -force

Get-UcsOrg -Level root | Get-UcsFabricMulticastPolicy -Name "default" -LimitScope | Remove-UcsFabricMulticastPolicy -force

Get-UcsOrg -Level root | Get-UcsQosPolicy -Name "qos-1" -LimitScope | Remove-UcsQosPolicy -force

#Servers - Remove Sub-Organizations - From Emulator
Get-UcsOrg -Level root | Get-UcsOrg -Name "Finance" -LimitScope | Remove-UcsOrg -Force

#Admin - Remove default DNS Entry - From Emulator
Start-UcsTransaction
$mo = Get-UcsDns | Set-UcsDns -AdminState "enabled" -Descr "" -Domain "localdomain" -PolicyOwner "local" -Port 0 -Force
$mo_1 = Get-UcsDnsServer -Name "172.16.104.2" | Remove-UcsDnsServer -Force
Complete-UcsTransaction


################################################################################################################################
### POLICIES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################################################################
#SET Equipment Policies

Start-UcsTransaction
Get-UcsOrg -Level root | Get-UcsRackServerDiscPolicy | Set-UcsRackServerDiscPolicy -Action $DefaultRackServerDiscovery -Descr "" -Name "default" -PolicyOwner "local" -Qualifier "" -ScrubPolicyName $DefaultScrub -Force
Get-UcsOrg -Level root | Get-UcsChassisDiscoveryPolicy | Set-UcsChassisDiscoveryPolicy -Action $DefaultDiscoveryAction -Descr "" -LinkAggregationPref $DefaultLinkGrouping -Name "" -PolicyOwner "local" -Rebalance "user-acknowledged" -Force
Get-UcsOrg -Level root | Get-UcsComputeServerMgmtPolicy | Set-UcsComputeServerMgmtPolicy -Action $DefaultRackManagement -Descr "" -Name "default" -PolicyOwner "local" -Qualifier "" -Force
if ($ChassisPower -ieq "grid")
	{
		Get-UcsOrg -Level root | Get-UcsPowerControlPolicy | Set-UcsPowerControlPolicy -Descr "" -PolicyOwner "local" -Redundancy "grid" -Force
	}
else
	{
		Get-UcsOrg -Level root | Get-UcsPowerControlPolicy | Set-UcsPowerControlPolicy -Descr "" -PolicyOwner "local" -Redundancy "n+1" -Force
	}
Complete-UcsTransaction

#Servers - Set Power Capping Policy
Write-Host -ForegroundColor DarkBlue "Setting Power Capping Policies"
Get-UcsOrg -Level root  | Add-UcsPowerPolicy -Descr "" -Name "No_Cap" -PolicyOwner "local" -Prio "no-cap"

#Servers - Set Scrub Policies
Write-Host -ForegroundColor DarkBlue "Setting Scrub Policies"
Get-UcsOrg -Level root  | Add-UcsScrubPolicy -BiosSettingsScrub "no" -Descr "" -DiskScrub "no" -Name "No_Scrub" -PolicyOwner "local"
#Get-UcsOrg -Level root  | Add-UcsScrubPolicy -BiosSettingsScrub "yes" -Descr "" -DiskScrub "no" -Name "BIOS_Scrub" -PolicyOwner "local"
#Get-UcsOrg -Level root  | Add-UcsScrubPolicy -BiosSettingsScrub "no" -Descr "" -DiskScrub "yes" -Name "Disk_Scrub" -PolicyOwner "local"
#Get-UcsOrg -Level root  | Add-UcsScrubPolicy -BiosSettingsScrub "yes" -Descr "" -DiskScrub "yes" -Name "Full_Scrub" -PolicyOwner "local"

#Servers - Serial over LAN Policies
Write-Host -ForegroundColor DarkBlue "Setting Serial over LAN policies"
Get-UcsOrg -Level root  | Add-UcsSolPolicy -AdminState "disable" -Descr "" -Name "No_SoL" -PolicyOwner "local" -Speed "9600"
Get-UcsOrg -Level root  | Add-UcsSolPolicy -AdminState "enable"  -Descr "" -Name "SoL_9600" -PolicyOwner "local" -Speed "9600"
Get-UcsOrg -Level root  | Add-UcsSolPolicy -AdminState "enable"  -Descr "" -Name "SoL_19200" -PolicyOwner "local" -Speed "19200"
Get-UcsOrg -Level root  | Add-UcsSolPolicy -AdminState "enable"  -Descr "" -Name "SoL_38400" -PolicyOwner "local" -Speed "38400"
Get-UcsOrg -Level root  | Add-UcsSolPolicy -AdminState "enable"  -Descr "" -Name "SoL_57600" -PolicyOwner "local" -Speed "57600"
Get-UcsOrg -Level root  | Add-UcsSolPolicy -AdminState "enable"  -Descr "" -Name "SoL_115200" -PolicyOwner "local" -Speed "115200"


#Servers - Set Power Capping Policy
Write-Host -ForegroundColor DarkBlue "Setting Power Capping Policies"
Get-UcsOrg -Level root  | Add-UcsPowerPolicy -Descr "" -Name "No_Cap" -PolicyOwner "local" -Prio "no-cap"



#CREATE Default BIOS Policy

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsBiosPolicy -Descr "" -Name "vSphere" -PolicyOwner "local" -RebootOnUpdate "no"
$mo_1 = $mo | Set-UcsBiosVfAssertNMIOnPERR -VpAssertNMIOnPERR "platform-default"
$mo_2 = $mo | Set-UcsBiosVfAssertNMIOnSERR -VpAssertNMIOnSERR "platform-default"
$mo_3 = $mo | Set-UcsBiosVfBootOptionRetry -VpBootOptionRetry "platform-default"
$mo_4 = $mo | Set-UcsBiosVfCPUPerformance -VpCPUPerformance "enterprise"
$mo_5 = $mo | Set-UcsBiosVfConsoleRedirection -VpBaudRate "platform-default" -VpConsoleRedirection "platform-default" -VpFlowControl "platform-default" -VpLegacyOSRedirection "platform-default" -VpTerminalType "platform-default" -XtraProperty @{VpPuttyKeyPad="platform-default"; }
$mo_6 = $mo | Set-UcsBiosVfCoreMultiProcessing -VpCoreMultiProcessing "all"
$mo_7 = $mo | Add-UcsManagedObject -XmlTag biosVfDRAMClockThrottling -ModifyPresent  -PropertyMap @{Dn="org-root/bios-prof-vSphere/DRAM-Clock-Throttling"; VpDRAMClockThrottling="platform-default"; }
$mo_8 = $mo | Set-UcsBiosVfDirectCacheAccess -VpDirectCacheAccess "platform-default"
$mo_9 = $mo | Set-UcsBiosVfDramRefreshRate -VpDramRefreshRate "platform-default"
$mo_10 = $mo | Set-UcsBiosEnhancedIntelSpeedStep -VpEnhancedIntelSpeedStepTech "enabled"
$mo_11 = $mo | Set-UcsBiosExecuteDisabledBit -VpExecuteDisableBit "enabled"
$mo_12 = $mo | Add-UcsManagedObject -XmlTag biosVfFrequencyFloorOverride -ModifyPresent  -PropertyMap @{Dn="org-root/bios-prof-vSphere/Frequency-Floor-Override"; VpFrequencyFloorOverride="platform-default"; }
$mo_13 = $mo | Set-UcsBiosVfFrontPanelLockout -VpFrontPanelLockout "platform-default"
$mo_14 = $mo | Set-UcsBiosHyperThreading -VpIntelHyperThreadingTech "enabled"
$mo_15 = $mo | Set-UcsBiosTurboBoost -VpIntelTurboBoostTech "enabled"
$mo_16 = $mo | Set-UcsBiosIntelDirectedIO -VpIntelVTDATSSupport "platform-default" -VpIntelVTDCoherencySupport "platform-default" -VpIntelVTDInterruptRemapping "platform-default" -VpIntelVTDPassThroughDMASupport "platform-default" -VpIntelVTForDirectedIO "platform-default"
$mo_17 = $mo | Set-UcsBiosVfIntelVirtualizationTechnology -VpIntelVirtualizationTechnology "enabled"
$mo_18 = $mo | Set-UcsBiosVfIntelEntrySASRAIDModule -VpSASRAID "platform-default" -VpSASRAIDModule "platform-default"
$mo_19 = $mo | Add-UcsManagedObject -XmlTag biosVfInterleaveConfiguration -ModifyPresent  -PropertyMap @{Dn="org-root/bios-prof-vSphere/Interleave-Configuration"; VpChannelInterleaving="platform-default"; VpMemoryInterleaving="platform-default"; VpRankInterleaving="platform-default"; }
$mo_20 = $mo | Set-UcsBiosVfLocalX2Apic -VpLocalX2Apic "platform-default"
$mo_21 = $mo | Set-UcsBiosLvDdrMode -VpLvDDRMode "performance-mode"
$mo_22 = $mo | Set-UcsBiosVfMaxVariableMTRRSetting -VpProcessorMtrr "platform-default"
$mo_23 = $mo | Set-UcsBiosVfMaximumMemoryBelow4GB -VpMaximumMemoryBelow4GB "platform-default"
$mo_24 = $mo | Set-UcsBiosVfMemoryMappedIOAbove4GB -VpMemoryMappedIOAbove4GB "platform-default"
$mo_25 = $mo | Set-UcsBiosVfMirroringMode -VpMirroringMode "platform-default"
$mo_26 = $mo | Set-UcsBiosNUMA -VpNUMAOptimized "enabled"
$mo_27 = $mo | Set-UcsBiosVfOSBootWatchdogTimer -VpOSBootWatchdogTimer "platform-default"
$mo_28 = $mo | Set-UcsBiosOSBootWatchdogTimerTimeoutPolicy -VpOSBootWatchdogTimerPolicy "platform-default"
$mo_29 = $mo | Set-UcsBiosVfOSBootWatchdogTimerTimeout -VpOSBootWatchdogTimerTimeout "platform-default"
$mo_30 = $mo | Set-UcsBiosVfOnboardStorage -VpOnboardSCUStorageSupport "platform-default"
$mo_31 = $mo | Add-UcsManagedObject -XmlTag biosVfPSTATECoordination -ModifyPresent  -PropertyMap @{Dn="org-root/bios-prof-vSphere/P-STATE-Coordination"; VpPSTATECoordination="platform-default"; }
$mo_32 = $mo | Set-UcsBiosVfPOSTErrorPause -VpPOSTErrorPause "enabled"
$mo_33 = $mo | Set-UcsBiosVfProcessorCState -VpProcessorCState "disabled"
$mo_34 = $mo | Set-UcsBiosVfProcessorC1E -VpProcessorC1E "disabled"
$mo_35 = $mo | Set-UcsBiosVfProcessorC3Report -VpProcessorC3Report "disabled"
$mo_36 = $mo | Set-UcsBiosVfProcessorC6Report -VpProcessorC6Report "disabled"
$mo_37 = $mo | Set-UcsBiosVfProcessorC7Report -VpProcessorC7Report "disabled"
$mo_38 = $mo | Add-UcsManagedObject -XmlTag biosVfProcessorEnergyConfiguration -ModifyPresent  -PropertyMap @{VpEnergyPerformance="platform-default"; VpPowerTechnology="platform-default"; Dn="org-root/bios-prof-vSphere/Processor-Energy-Configuration"; }
$mo_39 = $mo | Add-UcsManagedObject -XmlTag biosVfQPILinkFrequencySelect -ModifyPresent  -PropertyMap @{Dn="org-root/bios-prof-vSphere/QPI-Link-Frequency-Select"; VpQPILinkFrequencySelect="platform-default"; }
$mo_40 = $mo | Set-UcsBiosVfQuietBoot -VpQuietBoot "platform-default"
$mo_41 = $mo | Set-UcsBiosVfResumeOnACPowerLoss -VpResumeOnACPowerLoss "last-state"
$mo_42 = $mo | Add-UcsManagedObject -XmlTag biosVfScrubPolicies -ModifyPresent -PropertyMap @{VpPatrolScrub="platform-default"; VpDemandScrub="platform-default"; Dn="org-root/bios-prof-vSphere/Scrub-Policies"; }
$mo_43 = $mo | Set-UcsBiosVfSelectMemoryRASConfiguration -VpSelectMemoryRASConfiguration "platform-default"
$mo_44 = $mo | Set-UcsBiosVfSerialPortAEnable -VpSerialPortAEnable "disabled"
$mo_45 = $mo | Set-UcsBiosVfSparingMode -VpSparingMode "platform-default"
$mo_46 = $mo | Set-UcsBiosVfUSBBootConfig -VpLegacyUSBSupport "platform-default" -VpMakeDeviceNonBootable "platform-default"
$mo_47 = $mo | Set-UcsBiosVfUSBFrontPanelAccessLock -VpUSBFrontPanelLock "platform-default"
$mo_48 = $mo | Set-UcsBiosVfUSBSystemIdlePowerOptimizingSetting -VpUSBIdlePowerOptimizing "platform-default"
$mo_49 = $mo | Add-UcsManagedObject -XmlTag biosVfUSBPortConfiguration -ModifyPresent  -PropertyMap @{VpUSBPortFront="platform-default"; VpUSBPortSDCard="platform-default"; VpUSBPortInternal="platform-default"; VpUSBPortVMedia="platform-default"; VpPort6064Emulation="platform-default"; VpUSBPortKVM="platform-default"; Dn="org-root/bios-prof-vSphere/USB-port-configuration"; VpUSBPortRear="platform-default"; }
$mo_50 = $mo | Add-UcsManagedObject -XmlTag biosVfVGAPriority -ModifyPresent  -PropertyMap @{Dn="org-root/bios-prof-vSphere/VGA-Priority"; VpVGAPriority="platform-default"; }
Complete-UcsTransaction

#CREATE Disk Policy
Get-UcsOrg -Level root  | Add-UcsLocalDiskConfigPolicy -Descr "" -FlexFlashRAIDReportingState "disable" -FlexFlashState "disable" -Mode "raid-mirrored" -Name "RAID1" -PolicyOwner "local" -ProtectConfig "yes"

#CREATE Maintenance Policy
Get-UcsOrg -Level root  | Add-UcsMaintenancePolicy -Descr "" -Name "User_Ack" -PolicyOwner "local" -SchedName "" -UptimeDisr "user-ack"
Get-UcsOrg -Level root | Get-UcsMaintenancePolicy -Name "default" -LimitScope | Set-UcsMaintenancePolicy -Descr "" -PolicyOwner "local" -SchedName "" -UptimeDisr "user-ack"

#CREATE QOS Policies                                                                                                                                           
Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsQosPolicy -Descr "" -Name "ESX-IPStorage" -PolicyOwner "local"
$mo_1 = $mo | Add-UcsVnicEgressPolicy -ModifyPresent -Burst 10240 -HostControl "none" -Name "" -Prio "platinum" -Rate "line-rate"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsQosPolicy -Descr "" -Name "ESX-Mgmt" -PolicyOwner "local"
$mo_1 = $mo | Add-UcsVnicEgressPolicy -ModifyPresent -Burst 10240 -HostControl "none" -Name "" -Prio "silver" -Rate "line-rate"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsQosPolicy -Descr "" -Name "ESX-VMs" -PolicyOwner "local"
$mo_1 = $mo | Add-UcsVnicEgressPolicy -ModifyPresent -Burst 10240 -HostControl "none" -Name "" -Prio "gold" -Rate "line-rate"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsQosPolicy -Descr "" -Name "ESX-vMotion"-PolicyOwner "local"
$mo_1 = $mo | Add-UcsVnicEgressPolicy -ModifyPresent -Burst 10240 -HostControl "none" -Name "" -Prio "best-effort" -Rate "line-rate"
Complete-UcsTransaction

#CREATE Network Control Policy
Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsNetworkControlPolicy -Cdp "enabled" -Descr "" -MacRegisterMode "only-native-vlan" -Name "ESX" -PolicyOwner "local" -UplinkFailAction "link-down"
$mo_1 = $mo | Add-UcsPortSecurityConfig -ModifyPresent -Descr "" -Forge "allow" -Name "" -PolicyOwner "local"
Complete-UcsTransaction

#SERVER Set Memory Policy
Get-UcsOrg -Level root | Get-UcsComputeMemoryConfigPolicy -Name "default" -LimitScope | Set-UcsComputeMemoryConfigPolicy -BlackListing "enabled" -Descr "" -PolicyOwner "local"

##Boot from Local HD -broken
If ($BootFromHD -ieq "y")
	{
		Start-UcsTransaction
		$mo = Get-UcsOrg -Level root  | Add-UcsBootPolicy -Descr "Boot from local hard drive" -EnforceVnicName "yes" -Name "Boot_From_HD" -PolicyOwner "local" -RebootOnUpdate "no"
		$mo_2 = $mo | Add-UcsLsbootVirtualMedia -Access "read-only" -Order "2"
		$mo_3 = $mo | Add-UcsLsbootStorage -Order "1"
		$mo_3_1 = $mo_3 | Add-UcsLsbootLocalStorage 
		Complete-UcsTransaction
	}

#Create Server Pool
Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsServerPool -Descr "" -Name "All_Servers" -PolicyOwner "local"
Complete-UcsTransaction

# Automatic entry of blade and rack servers into server pool
Get-UcsOrg -Level root  | Add-UcsServerPoolPolicy -Descr "" -Name "Add_Blades" -PolicyOwner "local" -PoolDn "org-root/compute-pool-All_Servers" -Qualifier "All_Chassis"
Get-UcsOrg -Level root  | Add-UcsServerPoolPolicy -Descr "" -Name "Add_Racks" -PolicyOwner "local" -PoolDn "org-root/compute-pool-All_Servers" -Qualifier "All_Rack"

#Admin - Management Interfaces
Write-Host -ForegroundColor DarkBlue "Set Administrative Management Interface Details"
Start-UcsTransaction
$mo = Get-UcsTopSystem | Set-UcsTopSystem -Descr $UCSDesc -Owner $UCSOwner -Site $UCSSite -Force
$mo_1 = Get-UcsSvcEp | Set-UcsManagedObject -PropertyMap @{Descr=""; PolicyOwner="local"; } -Force
$mo_1_1 = Get-UcsDns | Set-UcsDns -AdminState "enabled" -Descr "" -Domain $UCSDNSDomain -PolicyOwner "local" -Port 0 -Force
Complete-UcsTransaction
if ($SystemName -ne "")
	{
		Get-UcsTopSystem | Set-UcsTopSystem -Name $SystemName -force	
	}

#Admin - SNMP Settings
Add-UcsSnmpTrap -Community "cnebingo" -Hostname "10.128.3.251" -NotificationType "traps" -Port 162 -V3Privilege "noauth" -Version "v2c"

#Admin - Time Zone Management
Write-Host -ForegroundColor DarkBlue "Set Timezone Management Information"
Get-UcsTimezone | Set-UcsTimezone -AdminState "enabled" -Descr "" -PolicyOwner "local" -Port 0 -Timezone $Timezone -Force
foreach ($ntpnumber in $NTPName)
	{
		if ($ntpnumber -ne "")
			{
				Add-UcsNtpServer -Descr "" -Name $ntpnumber
			}
	}

#Admin - DNS Management
Write-Host -ForegroundColor DarkBlue "Set DNS Management Information"
if ($PriDNS -ne "")
	{
		Add-UcsDnsServer -Descr "" -Name $PriDNS
	}
if ($SecDNS -ne "")
	{
		Add-UcsDnsServer -Descr "" -Name $SecDNS
	}

#Admin - Add UCS Radius Group
Start-UcsTransaction
$mo = Get-UcsRadiusGlobalConfig | Add-UcsProviderGroup -Descr "" -Name "UCSM"
$mo_1 = $mo | Add-UcsProviderReference -ModifyPresent -Descr "" -Name "sss-cat-radius1.cnb-ss.com" -Order "2"
$mo_2 = $mo | Add-UcsProviderReference -ModifyPresent -Descr "" -Name "sss-cat-radius2.cnb-ss.com" -Order "1"
$mo_3 = $mo | Add-UcsProviderReference -ModifyPresent -Descr "" -Name "sss-sil-radius1.cnb-ss.com" -Order "3"
Complete-UcsTransaction

#ADMIN - Set UCS Native Authentication
Start-UcsTransaction
$mo = Get-UcsNativeAuth | Set-UcsNativeAuth -ConLogin "local" -DefLogin "local" -DefRolePolicy "assign-default-role" -Descr "" -PolicyOwner "local"
$mo_1 = Get-UcsDefaultAuth | Set-UcsDefaultAuth -Descr "" -Name "" -ProviderGroup "UCSM" -Realm "radius" -RefreshPeriod 600 -SessionTimeout 7200 -Use2Factor "no"
Complete-UcsTransaction

#Admin - Create UCS Locale
Add-UcsLocale -Descr "" -Name "CNE" -PolicyOwner "local"

#Set Global QoS Settings
Write-Host -ForegroundColor DarkBlue "Setting Global QoS settings"
if (($FibreChannelQoSCoS -ine "3") -or ($FibreChannelQoSWeight -ine "5"))
	{
		Start-UcsTransaction
		$mo = Get-UcsQosclassDefinition | Set-UcsManagedObject -PropertyMap @{Descr=""; PolicyOwner="local"; } -Force
		$mo_1 = Get-UcsFcQosClass | Set-UcsFcQosClass -Cos $FibreChannelQoSCoS -Name "" -Weight $FibreChannelQoSWeight -Force
		Complete-UcsTransaction
	}
if (($BestEffortQoSCoS -ine "5") -or ($BestEffortQoSMTU -ne "normal") -or ($BestEffortQoSMulticastOptimized -ine "no") -or ($BestEffortQoSWeight -ine "5"))
	{
		Start-UcsTransaction
		$mo = Get-UcsQosclassDefinition | Set-UcsManagedObject -PropertyMap @{Descr=""; PolicyOwner="local"; } -Force
		$mo_1 = Get-UcsBestEffortQosClass | Set-UcsBestEffortQosClass -Mtu $BestEffortQoSMTU -MulticastOptimize $BestEffortQoSMulticastOptimized -Name "" -Weight $BestEffortQoSWeight -Force
		Complete-UcsTransaction
	}
if ($BronzeQoSEnabled -ieq "y")
	{
		Start-UcsTransaction
		$mo = Get-UcsQosclassDefinition | Set-UcsManagedObject -PropertyMap @{Descr=""; PolicyOwner="local"; } -Force
		$mo_1 = Get-UcsQosClass -Priority "bronze" | Set-UcsQosClass -AdminState "enabled" -Cos $BronzeQoSCoS -Drop $BronzeQoSPacketDrop -Mtu $BronzeQoSMTU -MulticastOptimize $BronzeQoSMulticastOptimized -Name "" -Weight $BronzeQoSWeight -Force
		Complete-UcsTransaction
	}
if ($SilverQoSEnabled -ieq "y")
	{
		Start-UcsTransaction
		$mo = Get-UcsQosclassDefinition | Set-UcsManagedObject -PropertyMap @{Descr=""; PolicyOwner="local"; } -Force
		$mo_1 = Get-UcsQosClass -Priority "silver" | Set-UcsQosClass -AdminState "enabled" -Cos $SilverQoSCoS -Drop $SilverQoSPacketDrop -Mtu $SilverQoSMTU -MulticastOptimize $SilverQoSMulticastOptimized -Name "" -Weight $SilverQoSWeight -Force
		Complete-UcsTransaction
	}
if ($GoldQoSEnabled -ieq "y")
	{
		Start-UcsTransaction
		$mo = Get-UcsQosclassDefinition | Set-UcsManagedObject -PropertyMap @{Descr=""; PolicyOwner="local"; } -Force
		$mo_1 = Get-UcsQosClass -Priority "gold" | Set-UcsQosClass -AdminState "enabled" -Cos $GoldQoSCoS -Drop $GoldQoSPacketDrop -Mtu $GoldQoSMTU -MulticastOptimize $GoldQoSMulticastOptimized -Name "" -Weight $GoldQoSWeight -Force
		Complete-UcsTransaction
	}
if ($PlatinumQoSEnabled -ieq "y")
	{
		Start-UcsTransaction
		$mo = Get-UcsQosclassDefinition | Set-UcsManagedObject -PropertyMap @{Descr=""; PolicyOwner="local"; } -Force
		$mo_1 = Get-UcsQosClass -Priority "platinum" | Set-UcsQosClass -AdminState "enabled" -Cos $PlatinumQoSCoS -Drop $PlatinumQoSPacketDrop -Mtu $PlatinumQoSMTU -MulticastOptimize $PlatinumQoSMulticastOptimized -Name "" -Weight $PlatinumQoSWeight -Force
		Complete-UcsTransaction
	}

################################################################################################################################
### RESOURCE POOLS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################################################################

#CREATE MAC Pools 

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsMacPool -AssignmentOrder "sequential" -Descr "" -Name "Fabric_A" -PolicyOwner "local"
$mo_1 = $mo | Add-UcsMacMemberBlock -From $MACafrom -To $MACato
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsMacPool -AssignmentOrder "sequential" -Descr "" -Name "Fabric_B" -PolicyOwner "local"
$mo_1 = $mo | Add-UcsMacMemberBlock -From $MACbfrom -To $MACbto
Complete-UcsTransaction

#CREATE Management IP Pool
Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsIpPool -AssignmentOrder "default" -Descr "" -ExtManaged "internal" -IsNetBIOSEnabled "disabled" -Name "Server-Management" -PolicyOwner "local" -SupportsDHCP "disabled"
$mo_1 = $mo | Add-UcsIpPoolBlock -DefGw $Gateway -From $StartIP -To $EndIP
Complete-UcsTransaction

#Servers - UUID Suffix Pools
Write-Host -ForegroundColor DarkBlue "Setting UUID Suffix Pools"
Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsUuidSuffixPool -AssignmentOrder "sequential" -Descr "" -Name "UUID_Pool" -PolicyOwner "local" -Prefix "derived"
$mo_1 = $mo | Add-UcsUuidSuffixBlock -From $UUIDfrom -To $UUIDto
Complete-UcsTransaction

#FOR NEW SETUP -broken
#LAN - IP Pool - IP Pool iscsi-initiator-pool
##Default Pool - Cannot be deleted so just putting bogus entries in it to prevent it from throwing a UCS error
Write-Host -ForegroundColor DarkBlue "Setting iSCSI Initiator Pools"
Get-UcsOrg -Level root | Get-UcsIpPool -Name "iscsi-initiator-pool" -LimitScope | Set-UcsIpPool -AssignmentOrder "sequential" -Descr "DO NOT USE THIS POOL" -PolicyOwner "local" -Force
Get-UcsOrg -Level root | Get-UcsIpPool -Name "iscsi-initiator-pool" -LimitScope | Add-UcsIpPoolBlock -DefGw $DefaultiSCSIPoolDefGW -From $DefaultiSCSIPoolFrom -PrimDns $DefaultiSCSIPrimDNS -SecDns $DefaultiSCSISecDNS -To $DefaultiSCSIPoolTo -Subnet $DefaultiSCSIPoolSubnet #create iscsi pool block to silence any alarms
#add-ucsippoolblock -IpPool "iscsi-initiator-pool" -from 0.0.0.1 -to 0.0.0.1 -modifypresent:$true
#
#create default wwn node pool block to silence any alarms
#add-ucswwnmemberblock -wwnpool node-default -from  20:00:00:25:B5:00:00:00 -to 20:00:00:25:B5:00:00:07


################################################################################################################################
### INFRASTRUCTURE  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################################################################
#Configure Server Ports
Write-Host -ForegroundColor DarkBlue "Configuring Server Ports"
if ($UCSEmulator -ieq "y")
	{
		Write-Host -ForegroundColor White -BackgroundColor DarkBlue "Since this is a UCS Emulator, we are skipping the configuration of server ports"
		sleep 5
	}
else
	{
		foreach ($sp in $ServerPort)
			{
				Start-UcsTransaction
				Get-UcsFabricServerCloud -Id "A" | Add-UcsServerPort -AdminState "enabled" -Name "" -PortId $sp["Port"] -SlotId $sp["Slot"] -UsrLbl $sp["LabelA"]
				Get-UcsFabricServerCloud -Id "B" | Add-UcsServerPort -AdminState "enabled" -Name "" -PortId $sp["Port"] -SlotId $sp["Slot"] -UsrLbl $sp["LabelB"]
				Complete-UcsTransaction
			}
	}
#Configure Uplink Ports
Write-Host -ForegroundColor DarkBlue "Configuring Uplink Ports"
foreach ($up in $UplinkPort)
	{
		Start-UcsTransaction
		Get-UcsFiLanCloud -Id "A" | Add-UcsUplinkPort -AdminSpeed "10gbps" -AdminState "enabled" -FlowCtrlPolicy "default" -Name "" -PortId $up["Port"] -SlotId $up["Slot"] -UsrLbl $up["LabelA"]
		Get-UcsFiLanCloud -Id "B" | Add-UcsUplinkPort -AdminSpeed "10gbps" -AdminState "enabled" -FlowCtrlPolicy "default" -Name "" -PortId $up["Port"] -SlotId $up["Slot"] -UsrLbl $up["LabelB"]
		Complete-UcsTransaction
	}

# LAN - Build LAN Port Channels
if ($LANPortChannels -ieq "y")
	{
		Get-UcsFiLanCloud -Id "A" | Add-UcsUplinkPortChannel -AdminSpeed "10gbps" -AdminState "enabled" -FlowCtrlPolicy "default" -Name $LANPortChannelAName -OperSpeed "10gbps" -PortId $LANPortChannelANumber
		if ($IsRedundantFI -ne $null)
			{
				Get-UcsFiLanCloud -Id "B" | Add-UcsUplinkPortChannel -AdminSpeed "10gbps" -AdminState "enabled" -FlowCtrlPolicy "default" -Name $LANPortChannelBName -OperSpeed "10gbps" -PortId $LANPortChannelBNumber
			}
		foreach ($up in $UplinkPort)
			{
				Start-UcsTransaction
				$mo = Get-UcsFiLanCloud -Id "A" | Add-UcsUplinkPortChannel -ModifyPresent  -AdminSpeed "10gbps" -AdminState "enabled" -FlowCtrlPolicy "default" -Name $LANPortChannelAName -OperSpeed "10gbps" -PortId $LANPortChannelANumber
				$mo_1 = $mo | Add-UcsUplinkPortChannelMember -AdminState "enabled" -Name "" -PortId $up["Port"] -SlotId $up["Slot"]
				Complete-UcsTransaction
				if ($IsRedundantFI -ne $null)
					{
						Start-UcsTransaction
						$mo = Get-UcsFiLanCloud -Id "B" | Add-UcsUplinkPortChannel -ModifyPresent  -AdminSpeed "10gbps" -AdminState "enabled" -FlowCtrlPolicy "default" -Name $LANPortChannelBName -OperSpeed "10gbps" -PortId $LANPortChannelBNumber
						$mo_1 = $mo | Add-UcsUplinkPortChannelMember -AdminState "enabled" -Name "" -PortId $up["Port"] -SlotId $up["Slot"]
						Complete-UcsTransaction
					}
			}
	}



#CREATE VLANS
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 132 -McastPolicyName "" -Name "ESX_vMotion" -PolicyOwner "local" -PubNwName ""-Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 433 -McastPolicyName "" -Name "IGT_ABS" -PolicyOwner "local" -PubNwName "" -Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 431 -McastPolicyName "" -Name "IGT_BC" -PolicyOwner "local" -PubNwName "" -Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 432 -McastPolicyName "" -Name "IGT_Bonus" -PolicyOwner "local" -PubNwName "" -Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 330 -McastPolicyName "" -Name "IGT_Data" -PolicyOwner "local" -PubNwName "" -Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 430 -McastPolicyName "" -Name "IGT_Xport" -PolicyOwner "local" -PubNwName "" -Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 102 -McastPolicyName "" -Name "IP_Storage" -PolicyOwner "local" -PubNwName "" -Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 200 -McastPolicyName "" -Name "Network_Management" -PolicyOwner "local" -PubNwName "" -Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 202 -McastPolicyName "" -Name "Server_Data" -PolicyOwner "local" -PubNwName ""-Sharing "none"
Get-UcsLanCloud | Add-UcsVlan -CompressionType "included" -DefaultNet "no" -Id 120 -McastPolicyName "" -Name "Server_Mgmt" -PolicyOwner "local" -PubNwName ""-Sharing "none"


################################################################################################################################
### vNIC/vHBA TEMPLATES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################################################################

#CREATE VNICS
Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_A" -Mtu 9000 -Name "ESX-IPStorage-A" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-IPStorage" -StatsPolicyName "default" -SwitchId "A" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "yes" -Name "IP_Storage"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_B" -Mtu 9000 -Name "ESX-IPStorage-B" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-IPStorage" -StatsPolicyName "default" -SwitchId "B" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "yes" -Name "IP_Storage"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_A" -Mtu 1500 -Name "ESX-Mgmt-A" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-Mgmt" -StatsPolicyName "default" -SwitchId "A" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "yes" -Name "Server_Mgmt"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_B" -Mtu 1500 -Name "ESX-Mgmt-B" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-Mgmt" -StatsPolicyName "default" -SwitchId "B" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "yes" -Name "Server_Mgmt"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_A" -Mtu 1500 -Name "ESX-VMs-A" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-VMs" -StatsPolicyName "default" -SwitchId "A" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_ABS"
$mo_2 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_BC"
$mo_3 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_Bonus"
$mo_4 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_Data"
$mo_5 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_Xport"
$mo_6 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "Server_Data"
$mo_7 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "Network_Management"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_B" -Mtu 1500 -Name "ESX-VMs-B" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-VMs" -StatsPolicyName "default" -SwitchId "B" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_ABS"
$mo_2 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_BC"
$mo_3 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_Bonus"
$mo_4 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_Data"
$mo_5 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "IGT_Xport"
$mo_6 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "Server_Data"
$mo_7 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "no" -Name "Network_Management"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_A" -Mtu 9000 -Name "ESX-vMotion-A" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-vMotion" -StatsPolicyName "default" -SwitchId "A" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "yes" -Name "ESX_vMotion"
Complete-UcsTransaction

Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicTemplate -Descr "" -IdentPoolName "Fabric_B" -Mtu 9000 -Name "ESX-vMotion-B" -NwCtrlPolicyName "ESX" -PinToGroupName "" -PolicyOwner "local" -QosPolicyName "ESX-vMotion" -StatsPolicyName "default" -SwitchId "B" -TemplType "updating-template"
$mo_1 = $mo | Add-UcsVnicInterface -ModifyPresent -DefaultNet "yes" -Name "ESX_vMotion"
Complete-UcsTransaction


##Create LAN Connectivity Policy
Start-UcsTransaction
$mo = Get-UcsOrg -Level root  | Add-UcsVnicLanConnPolicy -Descr "Connectivity Policy for IGT ESX Servers" -Name "IGT-Connectivity" -PolicyOwner "local"
$mo_1 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-Mgmt-A" -NwCtrlPolicyName "" -NwTemplName "ESX-Mgmt-A" -Order "3" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "A"
$mo_2 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-Mgmt-B" -NwCtrlPolicyName "" -NwTemplName "ESX-Mgmt-B" -Order "4" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "B"
$mo_3 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-VMs-A" -NwCtrlPolicyName "" -NwTemplName "ESX-VMs-A" -Order "5" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "A"
$mo_4 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-VMs-B" -NwCtrlPolicyName "" -NwTemplName "ESX-VMs-B" -Order "6" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "B"
$mo_5 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-vMotion-A" -NwCtrlPolicyName "" -NwTemplName "ESX-vMotion-A" -Order "7" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "A"
$mo_6 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-vMotion-B" -NwCtrlPolicyName "" -NwTemplName "ESX-vMotion-B" -Order "8" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "B"
$mo_7 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-IPStorage-A" -NwCtrlPolicyName "" -NwTemplName "ESX-IPStorage-A" -Order "1" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "A"
$mo_8 = $mo | Add-UcsVnic -AdaptorProfileName "VMWare" -Addr "derived" -AdminHostPort "ANY" -AdminVcon "any" -IdentPoolName "" -Mtu 1500 -Name "ESX-IPStorage-B" -NwCtrlPolicyName "" -NwTemplName "ESX-IPStorage-B" -Order "2" -PinToGroupName "" -QosPolicyName "" -StatsPolicyName "default" -SwitchId "B"
Complete-UcsTransaction

################################################################################################################################
### SERVICE PROFILES AND SERVICE PROFILE TEMPLATES  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################################################################

#Create SPT basics -broken
$SPName = "ESX_TEST"
$SPT = Add-UcsServiceProfile `
-Org "root" `
-Name $SPName `
-Descr "Production ESX Host Profile" `
-ExtIPPoolName "Server-Management" `
-ExtIPState "pooled" `
-HostFwPolicyName "default" `
-AgentPolicyName "" `
-BiosProfileName "vSphere" `
-BootPolicyName "default" `
-DynamicConPolicyName "" `
-IdentPoolName "UUID_Pool" `
-LocalDiskPolicyName "RAID1" `
-MaintPolicyName "User_Ack" `
-MgmtFwPolicyName "" `
-PolicyOwner "local" `
-PowerPolicyName $DefaultPowerControl `
-ScrubPolicyName $DefaultScrub `
-SrcTemplName "" `
-StatsPolicyName "default" `
-Type "updating-template" `
-UsrLbl "" `
-Uuid "0" `
-VconProfileName "" `

Get-UcsServiveProfile ESX-TEST | Add-UcsVnicConnDef -ModifyPresent -LanConnPolicyName $DefaultLANConnectivity



#Create a list of vNICs to Assign to this SPT and loop through and assign them

$vNicArray = `
"ESX-IPStorage-A", `
"ESX-IPStorage-B", `
"ESX-Mgmt-A", `
"ESX-Mgmt-B", `
"ESX-vMotion-A", `
"ESX-vMotion-B", `
"ESX-VMs-A", `
"ESX-VMs-B"


foreach ($vNicInstance in $vNicArray) {
    Get-UcsServiceProfile -Name $SPName | Add-UcsVnic -NwTemplName $vNicInstance -Name $vNicInstance -AdaptorProfileName "VMWare"
}

pause

################################################################################################################################
### Finishing Up and Closing down                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################################################################
Write-Host ""
Write-Host -ForegroundColor DarkGreen "Done with UCS base configuration Build"

#end script
##Disconnect from UCS
Write-Host -ForegroundColor DarkBlue "Disconnecting from UCS"
Disconnect-Ucs



