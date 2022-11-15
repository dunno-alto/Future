$vCenter="vcenter.domain.ext"
$vCenterAdmin="domain\UN"
$vCenterAdminPassword="Password"

write-host Connecting to vCenter Server $vcenter -foreground green
Connect-viserver $vCenter -user $vCenterAdmin -password $vCenterAdminPassword -WarningAction 0 | out-null
