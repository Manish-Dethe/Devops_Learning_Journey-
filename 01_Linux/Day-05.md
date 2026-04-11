# Day 5 - 

## Topics Covered
- System management
- Software management

## Commands Practiced

ls -la -> Will give the files but also the hidden files (which start with .), .bashhistory file is there which stores all the commands

## System Management
- history -> List all comands executed by a user
- free -> Gives how much free memory of a server is present and how much is used (gives in kb)
- free -m -> gives in mb
- cat /proc/memoinfo -> Displays memory information
- cat /proc/cpuinfo -> Displays CPU information
- uname -a -> Show kernel information
- du -> (Discuses of directory)Show directory space usage
- du -m -> Shows in mb
- du man -> To see how much options are present in this command
- du -k /var | sort -rn head -> Will give all the top 10 files having more space
- df -> Shows the filesystem in kb
- df -m -> gives in mb
- whereis -> Show possible locations of app
- which -> Show which app will be run by default

## Software Management
yim is the primary tool for getting, installing, deleting, querying, and managing RedHat Enterprise Linux RPM software packages from official RedHat software repositories, as well as other third-party repositories

- I am using Ubuntu but in linux yum is not used, here apt is used instead.
- (CentOS, Red HAt enterprise linux, Fedora) use yum and Ubuntu, Debian use apt

- Note: We can only do this commands if we are a root user

- Commands
 1. yum install <package name>
 2. yum remove <package name>
 3. yum update <package name>
 4. yum info <package name>
 5. yum list available
 6. yum list installed

## Notes
- We can use man command to see how many options are present in a specific command


