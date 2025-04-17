#!/bin/bash

# intitializin Colors
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
NC="\033[0m"  

#Title
echo -e "${GREEN}=============================================="
echo -e "${RED}      System Monitoring and Resource Usages      "
echo -e "${GREEN}=============================================="
echo ""


# Check Internet Connection
echo -e "${CYAN}Internet:${NC} $(ping -c 1 google.com &> /dev/null && echo -e "${GREEN}Connected${NC}" || echo -e "${RED}Disconnected${NC}")"

# OS Name and Version
echo -e "\n${CYAN}Operating System Type:${NC} $(uname -o)"
echo -e "${CYAN}OS Version:${NC} $(lsb_release -d | awk -F'\t' '{print $2}')"
echo -e "${CYAN}Architecture:${NC} $(uname -m)"
echo -e "${CYAN}Kernel Release:${NC} $(uname -r)"

# Hostname, Internal IP Address, External IP Address, MAC Address
echo -e "${CYAN}Hostname:${NC} $(hostname)"
echo -e "${CYAN}Internal IP:${NC} $(hostname -I | awk '{print $1}')"
echo -e "${CYAN}External IP:${NC} $(curl -s ifconfig.me)"
echo -e "${CYAN}MAC Address:${NC}"
ip link show | grep -E 'link/ether' | awk '{print $2}' | while read line; do
    echo -e "  ${NC}$line${NC}"
done

# DNS Servers
echo -e "${CYAN}Name Servers:${NC}"
cat /etc/resolv.conf | grep -E '^nameserver' | awk '{print $2}' | while read line; do
    echo -e "  ${YELLOW}$line${NC}"
done

# Hardware Information
echo -e "\n${CYAN}Hardware Information:${NC}"
echo -e "${YELLOW}CPU:${NC} $(lscpu | grep 'Model name' | awk -F':' '{print $2}' | sed 's/^[ \t]*//')"
echo -e "${YELLOW}CPU Architecture:${NC} $(lscpu | grep 'Architecture' | awk -F': ' '{print $2}' | sed 's/^[ \t]*//')"
echo -e "${YELLOW}CPU Op-modes:${NC} $(lscpu | grep 'CPU op-mode(s)' | awk -F':' '{print $2}' | sed 's/^[ \t]*//')"
echo -e "${YELLOW}Address Sizes:${NC} $(lscpu | grep 'Address sizes' | awk -F':' '{print $2}' | sed 's/^[ \t]*//')"
echo -e "${YELLOW}Number of Cores:${NC} $(lscpu | grep "^CPU(s):" | awk '{print $2}')"



echo -e "${YELLOW}Total RAM:${NC} $(free -h | awk '/^Mem/ {print $2}')"
echo -e "${YELLOW}Disk Size:${NC}"
lsblk -d -o NAME,SIZE | grep -E '^[a-z]' | while read line; do
    echo -e "  ${NC}$line${NC}"
done

# Logged In Users
echo -e "\n${CYAN}Logged In users:${NC}"
who | while read line; do
    echo -e "  ${YELLOW}$line${NC}"
done

# RAM and Swap Usage
echo -e "\n${CYAN}Ram Usages:${NC}"
free -h | awk '/^Mem/ {print "  Total:", $2, "\nUsed:", $3, "\nFree:", $4}' | while read line; do
    echo -e "${YELLOW}$line${NC}"
done

echo -e "\n${CYAN}Swap Usages:${NC}"
free -h | awk '/^Swap/ {print "  Total:", $2, "\nUsed:", $3, "\nFree:", $4}' | while read line; do
    echo -e "${YELLOW}$line${NC}"
done

# Disk Usage
echo -e "\n${CYAN}Disk Usages:${NC}"
df -h --output=source,size,used,avail,pcent,target | while read line; do
    echo -e "${YELLOW}$line${NC}"
done


# System Uptime
echo -e "\n${CYAN}System Uptime Days/(HH:MM):${NC}"
uptime -p | while read line; do
    echo -e "${YELLOW}$line${NC}"
done
