#!/bin/bash

# Activate the Conda environment
echo "Activating Conda environment 'comfyui'"
source activate CHANGE ME

# Function to check if a port is in use
check_port() {
    netstat -tuln | grep ":[0-9]*" | awk '{print $4}' | grep -E ":[0-9]+$" | grep -q ":$1$"
    return $?
}

# Function to kill the process using a specific port
kill_process_using_port() {
    pid=$(lsof -t -i:$1 -sTCP:LISTEN)
    if [[ -n "$pid" ]]; then
        echo "Killing process $pid on port $1"
        kill -9 $pid
        sleep 2  # Wait for the process to be killed
    fi
}

# Define default port
port=8180
debug_port=8190  # Define debug port

# Navigate to the script directory
cd CHANGE ME

# Check and free application port
if check_port $port; then
    echo "Port $port is in use, attempting to free it..."
    kill_process_using_port $port

    if check_port $port; then
        echo "Port $port is still in use, moving to port 5941"
        port=5941
    fi
fi

# Check and free debug port
if check_port $debug_port; then
    echo "Debug port $debug_port is in use, attempting to free it..."
    kill_process_using_port $debug_port
fi

# Run the Python script with debugpy
echo "Running Python script with debugpy on debug port $debug_port, start the debugger"
python -Xfrozen_modules=off -m debugpy --listen 127.0.0.1:$debug_port --wait-for-client main.py --port $port

# Keep the terminal open
exec bash
