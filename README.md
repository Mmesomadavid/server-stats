# Server Stats Script

A simple Bash script to analyze basic **server performance stats** on Linux systems.  
This script helps you quickly check CPU, memory, disk usage, and the top processes, making it easier to monitor and debug server performance.

---

## Features

- Total CPU usage
- Total memory usage (Free vs Used including percentage)
- Total disk usage (Free vs Used including percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage
- Optional (stretch goals):
  - OS version
  - Uptime
  - Load average
  - Logged-in users
  - Failed login attempts

---

## Getting Started

### Prerequisites

- Linux server or WSL Ubuntu
- Bash shell
- Git (optional, for downloading from GitHub)

---

### Installation

1. Clone the repository (or download the `server-stats.sh` file):

```bash
git clone https://github.com/yourusername/server-stats.git
cd server-stats
```

### Make script executable
```bash
chmod +x server-stats.sh
```

## Run the script in the terminal
```bash
./server-stats.sh
```


