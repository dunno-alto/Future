<# $vmHost = Get-VMHost -Name "10.110.253.11"
Import-vApp -Source "c:\ScriptsPS\Dev\vxms-6.0.0-37_b1.ova" -VMHost $vmHost #>

$myDatastore = Get-Datastore -Name "datastore-name"
$vmHost = Get-VMHost -Name "host IP or name"
$vmHost | Import-vApp -Source "E:\path-to-folder\ovf-file.ova" -Datastore $myDatastore -Force
