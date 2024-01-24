#!/bin/bash

# Define the file to capture output
LOG_FILE="disk-benchmark-background-log.txt"

# Run dd benchmark in the background, redirecting output to the log file
(time dd if=/dev/zero of=/tmp/dd_benchmark bs=1M count=1000) &> "$LOG_FILE" &
echo "Ayesha's terminal"
echo "Disk benchmark is running in the background. Check '$LOG_FILE' for results."
echo "You can close this terminal, and the benchmark will continue."

# Sleep for at least 10 seconds (adjust as needed)
sleep 10

# Optionally, you can display the background job status
jobs

# Note: The benchmark will continue even if the SSH or terminal session is terminated.
