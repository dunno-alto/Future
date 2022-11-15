Get-VMHostService -VMHost * | Where-Object {$_.Key -eq "TSM-SSH" } | Start-VMHostService

Get-VMHost | Get-AdvancedSetting UserVars.SuppressShellWarning | Set-AdvancedSetting -Value 1