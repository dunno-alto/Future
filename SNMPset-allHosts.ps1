$vcsa = "vcenter.domain.ext" # Your vSphere server
$snmpdROCommunities = "name" # v2c RO comminuties (can comma seperated list of up to 10)
$syscontact = "administrator@vsphere.local" # Set the snmp attributes
$syslocation = "container name"
$port = "162" #Change the port if you want
$me = Get-Credential -Message "vSphere Admin"
 
Connect-VIServer -Server $vcsa -Credential $me | Out-Null
 
$vmhosts = Get-VMHost | where {$_.ConnectionState -eq "Connected"}
foreach ($vmhost in $vmhosts) {
  #Set SNMP settings using new V2 esxcli interface
  $esxcli = Get-EsxCli -VMHost $vmhost -V2
  $arguments = $esxcli.system.snmp.set.CreateArgs()
  $arguments.communities = $snmpdROCommunities
  $arguments.enable = $true
  $arguments.port = $port
  $arguments.syscontact = $syscontact
  $arguments.syslocation = $syslocation
 
  $esxcli.system.snmp.set.Invoke($arguments)
 
  #Quickly dump out the new config
  write-host $vmhost.Name
  $esxcli.system.snmp.get.Invoke()
 
  $snmpd = Get-VMHostService -VMHost $vmhost | where {$_.Key -eq "snmpd"}
  #Start SNMP service - if not configured properly it will error here
  $snmpd | start-VMhostservice
  #configure Auto start and stop with host
  $snmpd | set-VMhostservice -Policy "On"
}
 
Disconnect-VIServer -Server $vcsa
