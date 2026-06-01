# Linux Project 5: Backup Automation Script

## Objective
The goal of this project is to automate file backups using a shell script. The script creates a compressed archive of important files and stores it in a dedicated backup directory with a unique timestamp.

## What I Did
* Created a source directory containing sample files
* Created a backup directory to store backup archives
* Developed a shell script (`backup.sh`) to automate the backup process
* Generated timestamp-based backup filenames
* Compressed files into `.tar.gz` format
* Verified backup creation and contents

## Script Functionality

* Generates a unique timestamp for every backup
* Creates a compressed archive using `tar`
* Stores backups in the `backups` directory
* Prevents overwriting previous backups
* Displays backup status messages

## Commands Used

### Create Directories
```bash
mkdir source_data
mkdir backups
```

### Create Sample Files
```bash
touch source_data/file1.txt
touch source_data/file2.txt
touch source_data/file3.txt
```

### Make Script Executable
```bash
chmod +x backup.sh
```

### Run Script
```bash
./backup.sh
```

### Verify Backup File
```bash
ls backups
```

### View Backup Contents
```bash
tar -tzf backup_file_name.tar.gz
```

## What I Learned
* Shell scripting basics
* Using variables in Bash
* Working with timestamps
* File compression using tar and gzip
* Backup automation concepts
* Linux file management

## Conclusion
This project helped me understand how automated backup systems work in Linux environments. It demonstrated how shell scripting can be used to automate repetitive administrative tasks and securely store backups using compressed archives.
