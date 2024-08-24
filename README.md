# System Resource Monitoring Script

This script monitors various system resources on a proxy server and displays the information in a dashboard format.

## Features

- **Top 10 Most Used Applications**: Displays the top 10 applications consuming the most CPU and memory.
- **Network Monitoring**: Monitors the number of concurrent connections, packet drops, and network traffic (MB in and out).
- **Disk Usage**: Displays disk space usage by mounted partitions and highlights partitions using more than 80% of the space.
- **System Load**: Shows the current load average for the system and a breakdown of CPU usage.
- **Memory Usage**: Displays total, used, and free memory, along with swap memory usage.
- **Process Monitoring**: Displays the number of active processes and shows the top 5 processes in terms of CPU and memory usage.
- **Service Monitoring**: Monitors the status of essential services like `sshd`, `nginx`, and `iptables`.

## Usage

### Run the Full Dashboard

```bash
./monitoring.sh
