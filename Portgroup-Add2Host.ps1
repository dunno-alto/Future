cls
$vHost = Read-Host -Prompt 'Input Host(s)'
$vSwitch = Read-Host -Prompt 'Input Existing vSwitch to Add'
$vlanName = Read-Host -Prompt 'Input VLAN Name'
$vlanID = Read-Host -Prompt 'Input VLAN Number'

Get-VMHost $vHost | Get-VMHost | Get-VirtualSwitch -Name $vSwitch | New-VirtualPortGroup -Name "$vlanName" -VLanId $vlanID

Pause

Get-VMHost $vHost | Get-VirtualSwitch -Name $vSwitch | Get-VirtualPortGroup