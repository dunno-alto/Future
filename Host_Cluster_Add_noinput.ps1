$esxihosts = ("10.1.1.1","10.1.1.2")
$esxihostuser = "root"
$esxihostpasswd = "password"
$vcentercluster = "name-of-cluster"
#
# You don't have to change anything below this line
# ---------------------------------------------------
#
write-host --------
write-host Start adding ESXi hosts to the vCenter
write-host --------
#
foreach ($esxihost in $esxihosts) {
Add-VMHost $esxihost -Location $vcentercluster -User $esxihostuser -Password $esxihostpasswd -force
}
