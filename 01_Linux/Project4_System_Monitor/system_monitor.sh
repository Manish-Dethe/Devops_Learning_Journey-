#!/bin/bash

echo "===== System Health Report ====="
echo ""

echo "Date & Time:"
date
echo ""

echo "System Uptime:"
uptime
echo ""

echo "Memory Usage:"
free -m
echo ""

echo "Disk Usage:"
df -h
echo ""

echo "CPU Information:"
grep "model name" /proc/cpuinfo | head -1
