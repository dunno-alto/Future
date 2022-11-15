$DCList = Get-Content -Path "C:\path-to-folder\DataCenterlist.txt"
foreach ($DC in $DCList){
Get-datacenter "$DC" | Select Name,@{N="NumVM";E={($_ | Get-VM).Count}} 
}
