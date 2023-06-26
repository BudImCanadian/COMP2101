#!/bin/bash

# This script displays system information

# Function to display help information
source reportfunctions.sh

# Check for root permissions
if [[ $(id -u) -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Function to display help information
function displayhelp {
    echo "Usage: scriptname [OPTIONS]"
    echo "Options:"
    echo "  -h, --help        Display this help message"
    echo "  -system, --system      Display system information"
    echo "  -disk, --disk         Display all information"
    echo "  -v, --verbose     Run script verbosely and show errors"
}

# while loop to check for options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            displayhelp
            exit 0
            ;;
        -system|--system)
            system
            osreport
            cpuinfo
            ramreport
            video
            exit 0
            ;;
        -disk|--disk)
            disktable
            exit 0
            ;;
        -network|--network)
            networkreport
            exit 0
            ;;
        -v|--verbose)
            set -v
            ;;
        *)
            echo "Invalid option: $1"
            exit 1
            ;;
    esac
    shift
done

# Default behavior when no options are provided
cpuinfo
system
osreport
ramreport
video
disktable
networkreport
