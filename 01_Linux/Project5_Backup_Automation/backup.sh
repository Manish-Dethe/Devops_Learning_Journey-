#!/bin/bash

echo "==== Backup Script Started ===="

timestamp=$(date +%Y-%m-%d_%H-%M-%S)

backup_name="backup_$timestamp.tar.gz"

tar -czf backups/$backup_name source_data

echo "Backup created successfully!"

echo "Backup File: $backup_name"

echo "==== Backup Completed ===="
