#!/bin/bash
# server-stats.sh
# Script to analyze basic server performance stats

echo "================ SERVER PERFORMANCE STATS ================"

# 1️⃣ Total CPU usage
echo -e "\nCPU Usage:"
# The top command with 1 iteration, extract CPU idle and calculate usage
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d"." -f1)
cpu_usage=$((100 - cpu_idle))
echo "Total CPU Usage: $cpu_usage%"

# 2️⃣ Total Memory usage
echo -e "\nMemory Usage:"
# Use free command to get memory stats
mem_total=$(free -m | awk '/Mem:/ {print $2}')
mem_used=$(free -m | awk '/Mem:/ {print $3}')
mem_free=$(free -m | awk '/Mem:/ {print $4}')
mem_percent=$((mem_used * 100 / mem_total))
echo "Total Memory: ${mem_total}MB"
echo "Used Memory: ${mem_used}MB"
echo "Free Memory: ${mem_free}MB"
echo "Memory Usage: ${mem_percent}%"

# 3️⃣ Total Disk usage
echo -e "\nDisk Usage:"
# Use df to get root partition stats
disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_free=$(df -h / | awk 'NR==2 {print $4}')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')
echo "Total Disk: $disk_total"
echo "Used Disk: $disk_used"
echo "Free Disk: $disk_free"
echo "Disk Usage: $disk_percent"

# 4️⃣ Top 5 processes by CPU usage
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6

# 5️⃣ Top 5 processes by Memory usage
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -n 6

# 🌟 Optional stretch goals
echo -e "\nAdditional Stats:"
echo "OS Version: $(uname -a)"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo "Logged in Users: $(who | wc -l)"
echo "Failed Login Attempts (last 24h): $(sudo lastb | wc -l 2>/dev/null || echo 'Requires sudo')"

echo "========================================================="
