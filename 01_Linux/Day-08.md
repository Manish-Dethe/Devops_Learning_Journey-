# Day 8 - 

## Topics Covered
- Process management
- Archiving files or directories
- Crontab

## Commands Practiced

## Process management
- When you start a program or running an application in Linux, it actually run as a process
- A Linux process (a daemon), running in foreground or in the background, uses memory and CPU resources.

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
- In any operating sysyem, it is possible to create jobs that you want to reoccur. This process known as job scheduling, is usually done based on user-defined jobs. For RedHat or any other Linux, this process is handled by the cron service or a daemon called crond, which can be used to schedule tasks

- crontab -l -> list out all the jobs which i have created
- crontab -e -> will open the nano to write the jobs (ex:- 30 08 * * * "1" >> /tmp/file1)

- 30 8 * * * Command -> Execute a job at 8:30 on everyday morning
- 00 14 * * 6 Command -> Execute a job at 2:00 PM on every Saturday
- 00 00 01 06 * Command -> Execute a job at 12:00 on 1st July
- 30 15 25 * * Command -> Execute a job at 3:30 PM on every month 25th

## Notes
- Killing the process is not the good way, if you dont have command to stop the service then you can use it
- Dont kill the root processes otherwise all the processes can be killed

- If we compree the directory then it will be converted to file and if we unzip it then it will be directory only