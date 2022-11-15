Write-Host "                                                                                 "  -backgroundcolor red -ForegroundColor Black
Write-Host "                           Add multiple disks to VM                              "  -backgroundcolor red -ForegroundColor Black
Write-Host "                                                                                 "  -backgroundcolor red -ForegroundColor Black
Write-Host "                                                                                 "
Write-Host "                                                                                 "
$vmname = read-host "VM Name to add disks to"
$num_disks = read-host "number of disks to add"
#$format = read-host "Disk Format (thin, thick, EagerZeroedThick)"
$size = read-host "Disk Size (GB)"
$vm = get-vm $vmname
$x=0
 

while ($x -lt $num_disks){
write-host "Adding $size VMDK to $vm on datastore $datastore"
New-HardDisk -vm "$vmname" -CapacityGB $size -StorageFormat thin -WarningAction SilentlyContinue
$x++
}
