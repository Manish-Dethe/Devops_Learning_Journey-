# Linux command cheat sheet

- $ sudo su -  -> switching back to a root user
- ls /         -> What are the file system are present or what are the directories which were created,   / means it is a root

## Basic commands
- date -> Show the current date and time
- cal -> Shows this months calender
- uptime -> Show current uptime (From who much time the system is on)
- whoami -> Who are you logged in as
- finger -> Display information about user
- users/id -> Shows user information
- man -> Shows manual of command
- username -> Shows your user name (not worked)
- who /w -> Display who is online

## Read a file
- ls -> (list) directory listing
- pwd -> (present working directory) in which directory you are
- cat filename -> view file content
- less -> view a file page by page
- more -> output the content of file
- head -> output the first 10 lines of file, can also be used like (head -20 filename -> gives the first 20 lines)
- tail -> output the last 10 lines of file
- page -> display file page by page (not worked)

## Create & Delete file/Directory
- touch -> create a 0 bites file
- ls -l -> (long list) gives the detail information about the files, also gives in alphabetic order, (ll command) is also similar to it 
- ls -l -t -> gives the detail information of the file, sorted by most recently modified, t means timestamp(file which are created recently    will be shown above)
- ls -l -t -r -> gives the detail information of the file, sorted by most recently modified in reverse order
- ls -ltr -> all the three combined
- cat > filename -> create file and allow to write inside the file
- cat >> filename -> if we add some data then it will be appended to the file without removing the old one.
- cat filename -> used to open the file
- cat /etc/passwd -> Shows all the user, and their path
- sudo su -> going into the root user
- nano filename -> create a file if filename doesn't exist
- vi filename -> create a file if filename doesn't exist
- cd -> is used to change the directory
- cd .. -> come out from the directory

## Remove Files and Directories
- rm filename -> remove the file, (can also use rm file1 file2 for removing more than one file)
- rm -f -> if it is asking for the permission then we can use this to force remove the file without permission
- rm -f -r -> recursively delete all the content in the directory, (rm -rf can also be used)
- rm -rf * -> will delete all the filess and directories which are present (all of them), be causious while using this command

## Extra command
- tree -> will show the whole structure of files 

## Copy files or directories
- cp file1 file2 -> The data present in file1 (source file) will be copied in file2 (destination file)
- cp -R dir1 dir2 -> This will created a new directory dir2 and copy the data of dir1 to dir2

## Move or rename a file
- mv file2 dir2 -> Move the file2 (source) to inside dir2 (Destination)
- mv file1 file3 -> (Rename)Transfer the data from file1 to file3 and file1 simply vanish, logically we can say file1 is renamed to file3

## Change directory
- cd /tmp -> Dont consider my current directory, directly go to the tmp directory
- cd /root/dir1 -> (Absolute path) will switch to dir1 and it is absolute path because it is starting with slash (/)
- cd ../root/dir1 -> (Relevant path) will switch to dir1 and it is not starting with slash (/) thats why it is relevant path 

## How to search a file - commands(find, diff and file)
- find -> is used to find the files or directory's path, it is exactly like the find option in windows
- find / -name file -> Searches the entire system to find a file named exactly file
- find . -name file1 -> Searches for a file named file1 inside the current directory and all its subfolders
- diff file1 file2 -> Tells what difference is their between file1 and file2
- file file1 -> Simply tells what type of file it is (ASCII text, directory or other)

## Search a word in a file
- grep -> grep stands for Global Regular Expression Print. It is used to pick out the required expression from the file and print the output, it is also case sensitive
- grep hello file1 -> search for the word hello in file1 if it is present it will display the whole line otherwise it will not
- grep -i HELLO file1 -> It will ignore case sensitive and gives the output if the word is present
- ls -l | grep file2 -> It lists all files and shows only those whose name (or details) contain file2
- ls -l | grep ^d -> Shows only the directories which are present in current directory (because they are starting from d letter)
- grep ^t  file1 -> Shows the lines where the starting letter is t

## Replace a word in a file
- sed -> stands for stream editor, which is used to search a word in the file and replace it with the word required to be in the output,
 Note : it will only modify the output, but there will be no chnage i the original file
- sed 's/old_text/new_text/' file_name -> Replaces the first occurrence of old_text with new_text in each line of the file,(s -> substitute), if old text is alone and not part of any other word
- sed 's/old_text/new_text/g' file_name -> Replaces all occurrences of old_text with new_text in every line (g -> replace all occurences in each line), if it is part of any other word still it will going to be replaced
- sed -i 's/old_text/new_text/' file_name -> Replaces every occurrence of old_text with new_text in the entire file and saves the changes, (i -> edit the file directly), it will update the original file
- sed -n '5,10p' file_name -> Displays only lines 5 to 10 from the file, (n -> dont print anything by default, '5,10p' -> print line from 5 to 10)
- sed -n '10,20d' file_name -> remove the line from 10 to 20 after that it will gonna display



## User creation
- useradd john -> will create the user named john
- sudo adduser john -> will create user with home directory and all (worked in my linux)
- usermod -G john mark -> Will add the mark to the john group
- id mark -> show the details and id of mark

## Create password
- passwd john -> Will create the password for the john user
- sudo passwd john

- nano /etc/ssh//sshd_config -> (If we are doing in aws server then there will be private key authentication, also the PasswordAuthentication is selected no so we have to open using nano and edit it (no->yes) so that we can use password, for that above command is their)
- service sshd reload -> If we update any configuration then we need to update(reload) our services

- su - john -> To go inside the john user (or sudo su - john)
- cd ~ -> To go in home directory

## Permissions
- ls -ld /home/john -> Permissions for the directory
- chmod u+x file1 -> will give the user permission to execute
- chmod u+x,g-w,o=w file1 -> will give the user permission to execute, remove the write permission for group, give the other to write permission
- chown john:john file2 -> will change the owner to john and group to john of file2
- chown john file3 -> will only change the ownership to john

- file file1 -> Simply tells what type of file it is (ASCII text, directory, character, block or linked file)


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

ls -la -> Will give the files but also the hidden files (which start with .), .bashhistory file is there which stores all the commands

## Software Management
- Commands
 1. yum install <package name>
 2. yum remove <package name>
 3. yum update <package name>
 4. yum info <package name>
 5. yum list available
 6. yum list installed

## Collect network info, telnet, service(systemctl)
- hostname -> Lists the host name of the server, it is stored in (cat /etc/hostname) we can also update it
- hostname manish -> Temporarily update the hostname
- init 6 -> Will restart your system
- ping -> is used to check weather the target system is available or not
- wget [link] -> is used to download packages/softwares onto Linux system, paste the link of package which you want to download
- ifconfig or (ip addr)-> lists IP addrss(es) of the server
- telnet -> connect to remote host / check port availability status
- telnet localhost 80 -> to check weather the port number 80 is working or not, (localhost -> this system), if theere is a target system where you have to check then you need to replace it with the target system (IP address)
- curl -> access the application as from browser
- netstat -tulpn ->How many applications are running and on which port they are running

- Service -> This controls the starting ans stopping of the services (Whenever we install application we want to start or stop the application, service is usefull)
- chkconfig -> This controls which services are set to start on boot

- yum install httpd -> Will install the httpd service (in my ubuntu i have used apt install apache2 -y)
- service httpd status (systemctl status apache2) -> For checking weather it is running or not
- netstat -tulpn -> To check on which port the service (apache2) is running
- Next in ubuntu i starting the page of app in firefox using the ip address 
- telnet (ip address) (port) -> to see in the terminal

-service <name of the service> status -> To check the status of the service
-service <name of the service> start -> To start the service
-service <name of the service> stop -> To stop the service
-service <name of the service> reload -> To reload the service
-service <name of the service> restart -> To restart the service

- chkconfig --list -> To check availability of the service
- chkconfig <service> on -> To make the service available after restart
- chkconfig <service> off -> To make the service unavailable after restart

## Process management
- ps -ef -> list the process which are running in the system
- kill / kill -9 -> kill the process or service
- fg -> run the program in the foreground
- bg -> run the service in the back group
- top -> list top 20 process which are consuming more CPU

- ps -ef | grep apache2 -> list out all the running processes of apache2
- kill 1665(process id) - > will kill the process
- kill -9 2931 -> whatever happen just kill it

- sleep 10 & -> it will wait for 10 sec and in that time it will run the process in the background
- sleep 500 -> if you don't want this to continue then you can do (ctrl + Z)
- sleep 200
- jobs -> will show the stopped jobs (500 and 200)
- bg %1 -> will show first job (sleep 500 &) and run it in the background
- fg %2 -> will continue the second job (sleep 200 &) this will run on the foreground (screen)

## Archiving files or directories
- gzip -> Create a compressed file
- gunzip -> Unzip a file
- tar -> Extract tar file (for directory)

- apt install gzip -y 
- gzip file -> will compress the file with .gz extension (file.gz) and also reduce the space of the file
- gunzip file -> will extract the zip file to the normal file

- zip file1.zip file1 -> 
- unzip file1.zip -> will unzip the file1

# For directory
- tar -cvf dir1.tar dir1-> compress the dir1 file ,cvf(create, verbus, file), dir1.tar is its destination or name after compression
- tar -xvf dir1.tar -> extract the file which is a directory

- tar -xvzf dir1.tar.gz -> extract the file and also it is going to unzip (z flag do this)

## Crontab
- crontab -l -> list out all the jobs which i have created
- crontab -e -> will open the nano to write the jobs (ex:- 30 08 * * * "1" >> /tmp/file1)

- 30 8 * * * Command -> Execute a job at 8:30 on everyday morning
- 00 14 * * 6 Command -> Execute a job at 2:00 PM on every Saturday
- 00 00 01 06 * Command -> Execute a job at 12:00 on 1st July
- 30 15 25 * * Command -> Execute a job at 3:30 PM on every month 25th

## Softlink (Shortcut file)
 1. Size of the link file is equal to no. of characters in the name of original file
 2. If original file is deleted, link is broken and data is lost
 3. Command : ln -s <src_file> <dest_file>

## Hardlink (Backup file)
 1. Size of the both file is same
 2. If original file is deleted then also link wil contain data
 3. Command : ln <src_file> <dest_file>
