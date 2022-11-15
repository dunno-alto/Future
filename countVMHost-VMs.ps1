$DCList = Get-Content -Path "C:\path-to-folder\file.txt"
foreach ($DC in $DCList){

Get-Datacenter "$DC" | select name, @{N="Number Hosts"; E={($_ | get-vmhost).count}}, @{N="Number VMs"; E={($_ | get-vm).count}}
}
