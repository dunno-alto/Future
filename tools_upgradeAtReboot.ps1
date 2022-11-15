#create list of vms which need to upgrade vmware tools at reboot

$ManualUpdateVMs = "C:\path-to-folder\needsAutoUpgrade.txt"
	$VMS = Get-Content "$ManualUpdateVMs"
 
Foreach ($VM in ($VMS)) {
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$vmConfigSpec.Tools = New-Object VMware.Vim.ToolsConfigInfo
$vmConfigSpec.Tools.ToolsUpgradePolicy = "UpgradeAtPowerCycle"

Get-View -ViewType VirtualMachine | %{$_.ReconfigVM($vmConfigSpec)}
} 

<# Get-VM | Get-View | Where-Object {$_.Config.Tools.ToolsUpgradePolicy -like "manual"}|select name,@{N='ToolsUpgradePolicy';E={$_.Config.Tools.ToolsUpgradePolicy }} | Format-Table #>


<# Get-VM | where{$_.ExtensionData.Summary.Guest.ToolsVersionStatus -ne 'guestToolsCurrent'} | Select Name #>
