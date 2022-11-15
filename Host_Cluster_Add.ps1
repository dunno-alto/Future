$esxihosts = ("comma sep IP or hostnames")
$esxihostuser = "domain\username (hostlevel access)"
$esxihostpasswd = "password"
$vcentercluster = "cluster to be added to"
<# $vcenterDataCenter = "datacenter name" #>
#
# You don't have to change anything below this line
# ---------------------------------------------------
#
#Connect to vCenter Server
#
write-host --------
write-host Start adding ESXi hosts to the vCenter
write-host --------
#
# Add ESXi hosts
foreach ($esxihost in $esxihosts) {
Add-VMHost $esxihost -Location $vcentercluster -User $esxihostuser -Password $esxihostpasswd -force
}
