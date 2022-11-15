cls
$deleteVMs = "C:\path-to-folder\DeleteVM-Bulk_list.txt"
$VMS = Get-Content "$deleteVMs"	
	Write-Host "Step 1: List VMs on the chopping block" -BackgroundColor Green -ForegroundColor Black
	foreach($vm in $VMS){
	Get-VM $vm
	}
	Pause
	Write-Host "Step 2: Hard power-off on all VMs marked for death." -BackgroundColor Yellow -ForegroundColor Black
	Pause
	foreach($vm in $VMS){
		Stop-VM -VM $vm -confirm:$false
			}
	Pause
Write-Host "Step 3: Kill all VMs on this list" -BackgroundColor Red -ForegroundColor Black
	foreach($vm in $VMS){
		Remove-VM -VM $vm -DeletePermanently -confirm:$false 
			}
