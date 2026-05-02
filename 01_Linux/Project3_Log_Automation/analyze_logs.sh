#!/bin/bash

echo "===== Log Analysis Report ====="

error_count=$(grep -c "ERROR" app.log)
warning_count=$(grep -c "WARNING" app.log)

echo "Total Errors: $error_count"
echo "Total Warnings: $warning_count"

echo "------------------------------"
echo "ERROR Logs:"

grep "ERROR" app.log
