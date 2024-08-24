#!/bin/bash

# Function to display top 10 most used applications
display_top_apps() {
  echo "Top 10 Most Used Applications (by CPU):"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -11
  echo "Top 10 Most Used Applications (by Memory):"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -11
}

# Function to display network monitoring info
display_network_info() {
  echo "Network Monitoring:"
  echo "Number of concurrent connections:"
  ss -s | grep estab | awk '{print $3}'
  echo "Packet drops:"
  netstat -s | grep "packet receive errors"
  echo "Network traffic (MB in/out):"
  ifstat -T | awk '{print $6 " MB in, " $8 " MB out"}'
}

# Function to display disk usage
display_disk_usage() {
  echo "Disk Usage:"
  df -h | awk '$5 >= 80 {print $0}' # Highlight partitions using more than 80%
}

# Function to display system load
display_system_load() {
  echo "System Load:"
  uptime
  echo "CPU Usage Breakdown:"
  mpstat
}

# Function to display memory usage
display_memory_usage() {
  echo "Memory Usage:"
  free -m
}

# Function to display process monitoring
display_process_info() {
  echo "Process Monitoring:"
  echo "Number of active processes:"
  ps aux | wc -l
  echo "Top 5 processes by CPU:"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
  echo "Top 5 processes by Memory:"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6
}

# Function to monitor essential services
display_service_status() {
  echo "Service Monitoring:"
  for service in sshd nginx iptables; do
    echo "$service status:"
    systemctl is-active $service
  done
}

# Function to display full dashboard
display_dashboard() {
  clear
  display_top_apps
  echo ""
  display_network_info
  echo ""
  display_disk_usage
  echo ""
  display_system_load
  echo ""
  display_memory_usage
  echo ""
  display_process_info
  echo ""
  display_service_status
}

# Command-line switches
case $1 in
  -apps) display_top_apps ;;
  -network) display_network_info ;;
  -disk) display_disk_usage ;;
  -load) display_system_load ;;
  -memory) display_memory_usage ;;
  -process) display_process_info ;;
  -services) display_service_status ;;
  *) display_dashboard ;;
esac

# Refresh every few seconds for real-time monitoring
while true; do
  display_dashboard
  sleep 5
done
