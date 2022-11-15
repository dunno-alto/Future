$targetHost = read-host "Target host for logs"
$targetDS = read-host "Datastore location for log files"
$folderName = read-host "Host Folder name"

Get-AdvancedSetting -Entity (Get-VMHost $targetHost) -Name Syslog.global.logDir |
Set-AdvancedSetting -Value "[$targetDS] /HOST-LOGS/$folderName" -confirm:$false