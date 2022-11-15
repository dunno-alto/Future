$vhost = Read-Host -Prompt 'Input Existing Host IP'
$vSwitch = Read-Host -Prompt 'Input vSwitch name'

New-VirtualSwitch -Name $vSwitch -VMHost $vhost
