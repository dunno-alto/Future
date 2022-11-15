
Function Main_Menu {
$_cluster = Read-Host -Prompt 'Which cluster would you like to see mounted isos from?'
Get-Cluster $_cluster | Get-VM | Get-CDDrive | select @{N="VM";E="Parent"},IsoPath | where {$_.IsoPath -ne $null}
Action
}

Function Action {
	$DefaultVariables = $(Get-Variable).Name
	$choices1 = [Management.Automation.Host.ChoiceDescription[]] ( `
		(new-Object Management.Automation.Host.ChoiceDescription "&Unmount all","Start Maintenance"),
		(new-Object Management.Automation.Host.ChoiceDescription "&Exit the fuck out","&Exit Out of Here"));
			$answer1 = $host.ui.PromptForChoice("Unmount all isos from cluster", "Which action would you like to perform?", $choices1, 1)
			if ($answer1 -eq 0) {
				Get-Cluster $_cluster | Get-VM | Get-CDDrive | where {$_.IsoPath -ne $null} | Set-CDDrive -NoMedia -Confirm:$False
				Write-Host "All done"
				Main_Menu
					} elseif ($answer1 -eq 1) {
					Write-Host "Exiting Script!"
							} 
}

Main_Menu