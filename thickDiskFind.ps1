Get-Cluster "Cluster-name" | Get-Datastore | Get-VM | Get-HardDisk <# | Where {$_.storageformat -eq "Thick" }  #>| Select Parent, Name, CapacityGB, storageformat | FT -AutoSize
