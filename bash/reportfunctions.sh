#!/bin/bash

# Function to display CPU information
# Function to display CPU information
function cpuinfo {
    echo
    echo CPU Information
    echo ===============
    cpuspeed=$(sudo lshw -class processor| grep size | tail -1 | awk '{print $2}')
    cpumax=$(sudo lshw -class processor | grep capacity | tail -1 | awk '{print $2}')
    cpuinformation=$(sudo lshw -class processor | grep version | tail -1 | awk '{print $2, $3, $4, $5, $6, $7, $8}')
    cpuarchitecture=$(hostnamectl| grep Architecture | tail -1 | awk '{print $2}')
    corecount=$(sudo lshw -class processor | grep configuration | tail -1 | awk '{print $2, $3}')
    cpulonecache=$(lscpu | grep L1d | awk '{print $3}')
    cpultwocache=$(lscpu | grep L2 | awk '{print $3}')
    cpulthreecache=$(lscpu | grep L3 | awk '{print $3}')
    echo Manufacturer and Model: $cpuinformation
    echo Architecture: $cpuarchitecture
    echo Core count: $corecount
    echo Current Speed: $cpuspeed
    echo Max Speed: $cpumax
    echo L1 Cache: $cpulonecache
    echo L2 Cache: $cpultwocache
    echo L3 Cache: $cpulthreecache
}

# Function to display system information
function system {
    echo
    echo System Info
    echo ===========
    myfqdn=$(hostname -f)
    systemversion=$(hostnamectl 2>&1 | awk 'NR==7 {print $3, $4}')
    serialnumber=$(sudo lshw -class system 2>&1 | grep -w serial: | sed 's/.*serial: //')
    space=$(df / -h 2>&1 | awk 'NR==2 {print $4}')
    ip=$(ip addr 2>&1 | awk 'NR==10 {print $2}')
    manufacturer=$(sudo dmidecode -s system-manufacturer 2>/dev/null | head -n 1)
    description=$(sudo dmidecode -s system-product-name )
    
    echo Manufacturer: $manufacturer
    echo Description: $description
    echo Computer Serial Number: $serialnumber
}

# Function that will grab Linux Distro and Version
function osreport {
    echo
    echo Operating System
    echo ================
    linuxdistro=$(hostnamectl 2>&1 | awk 'NR==7 {print $3}')
    distroversion=$(hostnamectl 2>&1 | awk 'NR==7 {print$4}')
    
    echo Linux Distro: $linuxdistro
    echo Distro Version: $distroversion
}
# Grabbing the information for the table
function ramreport {
   manufacturer=$(sudo lshw -class memory | grep vendor | tail -1 | awk '{print $2, $3, $4}' )
   product=$(sudo lshw -class memory | grep DIMM | tail -1 | awk '{print $3}' )
   physical=$(sudo dmidecode —type memory | grep socket | tail -1 | awk '{print $4, $5}')
   memtotal=$(free -h | grep Mem | awk '{print $2}')
   ram=$(sudo dmidecode -t memory | grep size| tail -1 | awk '{print $2}')
   speed=$(free -h | grep Swap| awk '{print $3}' )
   
   echo
   echo Ram Information
   echo ===============
    #Creating the table with the variables
    {
        echo   
        echo "| Manufacturer | Model | Memory | Speed | Location"
        echo "| ${manufacturer// /.} | $product | $memtotal | $speed | ${physical// /.}"
    } | column -t 
}

#Grabbing video card information from lshw -C display
function video {
   echo 
   echo GPU Information
   echo ===============
   vendor=$(sudo lshw -C display | grep vendor | awk '{print $2}' )
   model=$(sudo lshw -C display | grep product | awk '{print $2, $3, $4}' )
   
   echo Manufacturer: $vendor
   echo Model: $model
}

function disktable {
   manufacturer=$(sudo lshw -class disk | grep vendor | tail -1 | awk '{print $2}' )
   product=$(sudo lshw -class disk | grep product | tail -1 | awk '{print $2}' )
   disksize=$(df -h | grep /dev/sda3 | tail -1 | awk '{print $2}')
   diskfree=$(df -h | grep /dev/sda3 | tail -1 | awk '{print $4}')
   physical=$(sudo lshw -class disk -businfo | grep /dev/sda | awk '{print $5, $6}')

#Creating the table with the variables using column -t to organize it
   echo
   echo Disk Information
   echo ================
    {
     echo
        echo "| Manufacturer | Product | Disksize | Available | Location"
        echo "| $manufacturer | $product | $disksize | $diskfree | ${physical// /.}"
    } | column -t 
}



