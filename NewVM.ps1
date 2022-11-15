
Write-Host "                                                                    " -foregroundcolor white -backgroundcolor blue 
Write-Host "                        Create New VM                               " -foregroundcolor white -backgroundcolor blue
Write-Host "                   Time to Input Parameters                         " -foregroundcolor white -backgroundcolor blue
Write-Host "                                                                    " -foregroundcolor white -backgroundcolor blue
#############################################################################################################################

$_name = Read-Host -Prompt 'Input Desired VM Name' 
$_cluster = Read-Host -Prompt 'Input Cluster for new VM'
$_DS = Read-Host -Prompt 'Input Datastore for VM'
$_template = Read-Host -Prompt 'Input Desired Template for cloning'
$_loc = Read-Host -Prompt 'Input Folder for new VM'
<# $_disksize = Read-Host -Prompt 'Disk size in GB'
$_memsize = Read-Host -Prompt 'Input memory in GB'
$_cpusize = Read-Host -Prompt 'Input how many CPUs needed' #> #>
<# $_network  = Read-Host -Prompt 'Input Network' #>
$_description = Read-Host -Prompt 'Input brief description of VM'

New-vm -Name $_name -ResourcePool $_cluster -Location $_loc -Datastore $_DS -Template $_template -Description $_description -DiskStorageFormat Thin -ErrorVariable ProcessError #-ErrorAction SilentlyContinue
If ($ProcessError) {
Write-Host "                                                                    " -foregroundcolor white -backgroundcolor blue
Write-Host ".......................Something's Fucked .........................." -foregroundcolor black -backgroundcolor red
Write-Host "                                                                    " -foregroundcolor white -backgroundcolor blue
}
if (!$ProcessError) { 
Write-Host "                                                                    " -foregroundcolor white -backgroundcolor blue
Write-Host "                          New VM Created                            " -foregroundcolor white -backgroundcolor blue
Write-Host "                                                                    " -foregroundcolor white -backgroundcolor blue
}
Pause