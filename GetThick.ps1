Get-datacenter Name-of-Datacenter | Get-VM | get-harddisk | Where {$_.storageformat -eq "Thick" } | Select Parent, Name, CapacityGB, storageformat | FT -AutoSize
