#!/bin/bash



#title
#labeled data showing:
#a table of the installed installed network interfaces (including virtual devices) with each table row having:
#Interface manufacturer
#Interface model or description
#Interface link state
#Interface current speed
#Interface IP addresses in CIDR format if configured
#Interface bridge master if part of a bridge
#DNS server(s) and search domain(s) if any are associated with the interface
#function errormessage which:
#saves the error message with a timestamp into a logfile named /var/log/systeminfo.log
#displays the error message to the user on stderr


#!/bin/bash

# Function to display network information
function networkreport {
    echo
    echo Network Information
    echo ===================
    interface=$(sudo lshw -class network | grep logical | head -n 1 | awk '{print $3}')
    manufacturer=$(sudo lshw -class network | grep vendor | head -n 1 | awk '{print $2}')
    model=$(sudo lshw -class network | grep product | head -n 1 | awk '{print $2}')
    linkstate=$(ip link | awk 'NR==3 {print $9}' )
    speed=$(sudo sudo ethtool ens33 | grep Speed | tail -1| awk '{print $2}')
    ip=$(ip addr | awk 'NR==10 {print $2}')
    {
    echo "| Manufacturer | Model | State | Speed | IP | "
    echo "| $manufacturer | $model | $linkstate | $speed | $ip |" 
    } | column -t
}

networkreport

