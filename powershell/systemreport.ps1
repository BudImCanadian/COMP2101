<<<<<<< HEAD
param(
    [switch]$System,
    [switch]$Disks,
    [switch]$Network
)

if (!$System -and !$Disks -and !$Network) {
# If no parameters are given on the command line, generate the full report with all functions
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
# Display the specified sections of the report for -system
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
# Display the specified sections of the report for -disks
    if ($Disks) {
        Write-Output "Physical Disk Drives Summary"
        Get-DiskInfo
    }
# Display the specified sections of the report for -network
    if ($Network) {
        Write-Output "Network Adapter Configuration Report"
        Get-NetworkAdapterConfig
    }
=======
param(
    [switch]$System,
    [switch]$Disks,
    [switch]$Network
)

if (!$System -and !$Disks -and !$Network) {
# If no parameters are given on the command line, generate the full report with all functions
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
# Display the specified sections of the report for -system
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
# Display the specified sections of the report for -disks
    if ($Disks) {
        Write-Output "Physical Disk Drives Summary"
        Get-DiskInfo
    }
# Display the specified sections of the report for -network
    if ($Network) {
        Write-Output "Network Adapter Configuration Report"
        Get-NetworkAdapterConfig
    }
>>>>>>> 9bcc8d0e5158d322133b5aa8ac2842c480996810
}