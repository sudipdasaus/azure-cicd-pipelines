#!/bin/bash

# Define DNS servers
dns_servers=("10.210.75.5" "10.210.75.4" "10.10.33.2" "10.20.33.2")

# File containing server names
filename="/home/ansible/sudip/server_name"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

# Perform DNS query for each server in the file
while IFS= read -r server; do
    echo "Querying DNS for server: $server"
    for dns_server in "${dns_servers[@]}"; do
        echo "Using DNS server: $dns_server"
        dig @"$dns_server" "$server.ce.corp" >> "/home/ansible/sudip/afterupgrade8.6.4_restart.txt"
    done
	echo "=======================================" >> "/home/ansible/sudip/afterupgrade8.6.4_restart.txt"
	echo "=======================================" >> "/home/ansible/sudip/afterupgrade8.6.4_restart.txt"
done < "$filename"
