#!/bin/bash

# Creating a Function to stop monitoring using Ctrl+C
function cleanup() {
    echo "Monitoring stopped."
    exit 0
}

# Registering the cleanup function for SIGINT (Ctrl+C) for easy termination
trap cleanup SIGINT

# Checking if the input log file path is provided or not
if [ $# -ne 1 ]; then
    echo "please provide input log file "
    exit 1
fi

# Assinging the user entered input to a variable 
logfile=$1

# Checkng  if log file exists or not
if [ ! -f "$logfile" ]; then
    echo "Error: Log file not found!"
    exit 1
fi

echo "Monitoring $logfile for new entries. Press Ctrl+C to stop."

# Continuously monitor log file for new entries and performing analysis
tail -f "$logfile" | \
while read line; do
    # Perform analysis on each log entry
    # Example: Count occurrences of 'error' keyword
    error_count=$(echo "$line" | grep -c 'error')

    # Print the log entry
    echo "$line"

    # Print analysis results
    if [ $error_count -gt 0 ]; then
        echo "Error found! Count: $error_count"
    fi
    # Add more analysis here as needed

done

# Script execution will only reach here if Ctrl+C is pressed
cleanup

