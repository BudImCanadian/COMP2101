param(
    [switch]$System,
    [switch]$Disks,
    [switch]$Network
)
# If no parameters are given on the command line, generate the full report with all functions
if (!$System -and !$Disks -and !$Network) {
    Write-Output "System Hardware Description"
    Get-SystemHardware

    Write-Output "`nOperating System Name and Version Number"
    Get-OSInfo

    Write-Output "`nProcessor Description"
    Get-ProcessorInfo

    Write-Output "`nRAM Summary"
    Get-RAMInfo

    Write-Output "`nPhysical Disk Drives Summary"
    Get-DiskInfo

    Write-Output "`nNetwork Adapter Configuration Report"
    Get-NetworkAdapterConfig

    Write-Output "`nVideo Controller Information"
    Get-VideoControllerInfo
} else {
# Display system hardware, OSinfo, ProcessorInfo, RamInfo, and video controller information when =system is used
    if ($System) {
        Write-Output "System Hardware Description"
        Get-SystemHardware

        Write-Output "`nOperating System Name and Version Number"
        Get-OSInfo

        Write-Output "`nProcessor Description"
        Get-ProcessorInfo

        Write-Output "`nRAM Summary"
        Get-RAMInfo

        Write-Output "`nVideo Controller Information"
        Get-VideoControllerInfo
    }
# Display disk information when -disks is used
    if ($Disks) {
        Write-Output "Physical Disk Drives Summary"
        Get-DiskInfo
    }
# Display network information when -network is used
    if ($Network) {
        Write-Output "Network Adapter Configuration Report"
        Get-NetworkAdapterConfig
    }
}
