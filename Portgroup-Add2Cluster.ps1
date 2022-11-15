$vmCluster = Read-Host -Prompt 'Input Existing Cluster' 
$vSwitch = Read-Host -Prompt 'Input Existing vSwitch to Add'
$vlanName = Read-Host -Prompt 'Input VLAN Name'
$vlanID = Read-Host -Prompt 'Input VLAN Number'

Get-Cluster $vmCluster | Get-VMHost | Get-VirtualSwitch -Name $vSwitch | New-VirtualPortGroup -Name "$vlanName" -VLanId $vlanID

Pause

get-cluster $vmCluster | Get-VMHost | Get-VirtualSwitch -Name $vSwitch | Get-VirtualPortGroup