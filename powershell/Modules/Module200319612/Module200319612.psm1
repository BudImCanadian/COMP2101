# Function to get system hardware description
function Get-SystemHardware {
    $systemHardware = Get-CimInstance -ClassName Win32_ComputerSystem
    $systemHardware | fl
}

# Function to get operating system name and version number
function Get-OSInfo {
    $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
    $osInfo | fl
}

# Function to get processor description with speed, number of cores, and sizes of the L1, L2, and L3 caches if they are present
function Get-ProcessorInfo {
    $processorInfo = Get-CimInstance -ClassName Win32_Processor | Select-Object -First 1
    $processorInfo | fl
}

# Function to get a summary of the RAM installed with the vendor, description, size, and bank and slot for each DIMM as a table and the total RAM installed in the computer as a summary line after the table
function Get-RAMInfo {
    $totalcapacity = 0
    get-wmiobject -class win32_physicalmemory | 
    foreach {
        new-object -TypeName psobject -Property @{
            Manufacturer = $_.manufacturer;
            "Speed(MHz)" = $_.speed;
            "Size(MB)"   = $_.capacity / 1MB;
            Bank         = $_.banklabel;
            Slot         = $_.devicelocator;
        } | ft -AutoSize
        $totalcapacity += $_.capacity / 1MB
    }
    Write-Output "Total RAM: ${totalcapacity}MB"
}

# Function summary of the physical disk drives with their vendor, model, size, and space usage (size, free space, and percentage free) 
# of the logical disks on them as a single table with one logical disk per output line
function Get-DiskInfo {
    $diskdrives = Get-CimInstance CIM_DiskDrive

    foreach ($disk in $diskdrives) {
        $partitions = $disk | Get-CimAssociatedInstance -ResultClassName CIM_DiskPartition
        foreach ($partition in $partitions) {
            $logicaldisks = $partition | Get-CimAssociatedInstance -ResultClassName CIM_LogicalDisk
            foreach ($logicaldisk in $logicaldisks) {
                New-Object -TypeName PSObject -Property @{
                    Manufacturer = $disk.Manufacturer;
                    Location     = $partition.DeviceID;
                    Drive        = $logicaldisk.DeviceID;
                    "Size(GB)"   = [math]::Round($logicaldisk.Size / 1GB);
                    "Free Space(GB)" = [math]::Round($logicaldisk.FreeSpace / 1GB);
                    "Percentage Free" = [math]::Round(($logicaldisk.FreeSpace / $logicaldisk.Size) * 100)
                } | ft -AutoSize
            }
        }
    }
}

# Function to get network adapter configuration report from lab 3
function Get-NetworkAdapterConfig {
    Get-CimInstance win32_networkadapterconfiguration | ? {$_.ipenabled} | ft -AutoSize Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder
}

# Function to get the video card vendor, description, and current screen resolution in this format: horizontalpixels x verticalpixels 
function Get-VideoControllerInfo {
    $videoControllerInfo = Get-CimInstance -ClassName Win32_VideoController | Select-Object AdapterCompatibility, Description, VideoModeDescription | fl
    Write-Output $videoControllerInfo
}



