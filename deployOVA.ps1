$clusterName = Read-Host -Prompt 'Input name of cluster'
$myCluster = Get-Cluster -Name "$clusterName"
$IPHost = Read-Host -Prompt 'Input IP of Importing Host'
$vmHost = Get-VMHost -Name "$IPHost"
$vmName = Read-Host -Prompt 'Input Desired VM Name'
$ovaPath = Read-Host -Prompt 'Path and filename'
Import-vApp -Source $ovaPath -VMHost $vmHost -Location $myCluster -Name $vmName