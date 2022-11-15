Get-VM | Get-Snapshot | Where {$_.Created -lt (Get-Date).AddDays(-3)} | Select-Object VM, Name, Created

Write-Host "The next step will remove snapshots" -backgroundcolor Yellow -foregroundcolor Black
Write-Host "CTRL-C to abort or enter to delete" -backgroundcolor Yellow -foregroundcolor Black
pause
Write-Host "Are you sure?" -backgroundcolor Red -foregroundcolor Black
pause

Get-VM | Get-Snapshot | Where {$_.Created -lt (Get-Date).AddDays(-3)} | Remove-Snapshot -confirm:$false