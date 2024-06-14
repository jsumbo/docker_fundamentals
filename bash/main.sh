#!/bin/bash

# Check listening processes
echo "Listening Processes:"
sudo ss -tlunp

# Check all network connections
echo "All Network Connections:"
sudo ss -taunp

# Check established connections
echo "Established Connections:"
sudo ss -tunp

# Check listening processes with lsof
echo "Listening Processes with lsof:"
sudo lsof -nP -iTCP -sTCP:LISTEN

# Check all network connections with lsof
echo "All Network Connections with lsof:"
sudo lsof -nP -i

# Check established connections with lsof
echo "Established Connections with lsof:"
sudo lsof -nP -iTCP -sTCP:ESTABLISHED
