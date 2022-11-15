$myCol = @()
foreach ($cluster in Get-Cluster)
    {
        foreach($vmhost in ($cluster | Get-VMHost))
        {
            foreach($vm in (Get-VM -Location $vmhost)){
                $VMView = $vm | Get-View
                $VMSummary = "" | Select ClusterName,HostName,VMName,VMSockets,VMCores,CPUSockets,CPUCores
                $VMSummary.ClusterName = $cluster.Name
                $VMSummary.HostName = $vmhost.Name
                $VMSummary.VMName = $vm.Name
                $VMSummary.VMSockets = $VMView.Config.Hardware.NumCpu
                $VMSummary.VMCores = $VMView.Config.Hardware.NumCoresPerSocket
                $myCol += $VMSummary
            }
        }
    }