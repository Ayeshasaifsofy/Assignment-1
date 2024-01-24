#!/bin/bash

# Input file containing DNS names
MACHINE_LIST_FILE="network-test-machinelist.txt"

# Output file for latency results
LATENCY_FILE="network-test-latency.txt"

# Check if the input file exists
if [ ! -f "$MACHINE_LIST_FILE" ]; then
    echo "Error: Input file '$MACHINE_LIST_FILE' not found."
    exit 1
fi

# Loop through each DNS name in the input file
while IFS= read -r dns_name; do
    # Run ping, collect 3 samples, and capture the output
    ping_output=$(ping "$dns_name")
    echo "$ping_output"

    # Extract average RTT using grep and awk
    average_rtt=$(echo "$ping_output" | grep -oP 'round-trip.*?/.*?/.*?/' | awk -F'/' '{print $8}')

    # Check if average RTT is not empty
    if [ -n "$average_rtt" ]; then
        # Write the DNS name and average RTT to the output file
        echo "$dns_name $average_rtt" >> "$LATENCY_FILE"
    else
        echo "Error getting latency for $dns_name. Please check the name and try again."
    fi
done < "$MACHINE_LIST_FILE"

echo "Latency results written to '$LATENCY_FILE'."
