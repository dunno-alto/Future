$guestVMlist = "C:\path-to-folder\findHost.txt"
$VMS = Get-Content "$guestVMlist"

foreach($vm in $VMS){
Get-VM $vm -erroraction 'silentlycontinue' | Select Name,VMHost | Format-Table -hidetableheaders -Autosize
}
