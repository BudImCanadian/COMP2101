param(
    [switch]$System,
    [switch]$Disks,
    [switch]$Network
)

if (!$System -and !$Disks -and !$Network) {
    # If no parameters are given on the command line, generate the full report with all sections included
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
    # If parameters are given on the command line, generate the specified sections of the report
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

    if ($Disks) {
        Write-Output "Physical Disk Drives Summary"
        Get-DiskInfo
    }

    if ($Network) {
        Write-Output "Network Adapter Configuration Report"
        Get-NetworkAdapterConfig
    }
}