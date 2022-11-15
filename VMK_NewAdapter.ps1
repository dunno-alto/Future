
Write-Host "vMotion enabled by default, please disable in script if needed before continuing"

$vhost = Read-Host -Prompt 'Input Existing Host IP'
$vSwitch = Read-Host -Prompt 'Input vSwitch name'
$vmkIP = Read-Host -Prompt 'Input VMK Adapter IP'
$portgrp = Read-Host -Prompt 'Input Port Group Name'

New-VMHostNetworkAdapter -VMHost $vhost -PortGroup $portgrp -VirtualSwitch $vSwitch -IP $vmkIP -SubnetMask 255.255.255.0 -VMotionEnabled:$true


