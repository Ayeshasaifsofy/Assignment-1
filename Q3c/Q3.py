import matplotlib.pyplot as plt

# Input file containing latency data
LATENCY_FILE = "network-test-latency.txt"

# Read data from the file
with open(LATENCY_FILE, 'r') as file:
    lines = file.readlines()

# Extract DNS names and latency values
dns_names = [line.split()[0] for line in lines]
latency_values = [float(line.split()[1]) for line in lines]

# Create a bar graph
plt.bar(dns_names, latency_values, color='blue')
plt.xlabel('DNS Names')
plt.ylabel('Average RTT (ms)')
plt.title('Network Latency Test Results')

# Rotate x-axis labels for better readability
plt.xticks(rotation=45, ha='right')

# Automatically adjust the layout to fit the data
plt.tight_layout()

# Show the graph
plt.show()
