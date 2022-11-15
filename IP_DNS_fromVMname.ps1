$_name = Read-Host -Prompt 'Input Desired VM Name'
	get-vm $_name | Get-VMGuest | select HostName,IPAddress