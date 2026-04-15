# Day 9 - 

## Topics Covered
- Softlink and Hardlink
- Copy file between servers

## Commands Practiced
 
## Softlink (Shortcut file)
 1. Size of the link file is equal to no. of characters in the name of original file
 2. If original file is deleted, link is broken and data is lost
 3. Command : ln -s <src_file> <dest_file>

## Hardlink (Backup file)
 1. Size of the both file is same
 2. If original file is deleted then also link wil contain data
 3. Command : ln <src_file> <dest_file>

## Copy file between servers
- Windows to Linux
 Mobaxterm or winscp

- Linux to Linux
 SCP (secure copy) is a command line utility that allows you to securely copy files and directories between two systems.
 -> scp source_file_name username@destination_host:destination_folder

 ex -> scp file1 root@10.20.30.40:/tmp
       scp root@10.20.30.40:/tmp /home/ec2-user/

## Notes
- Their are two types of link file softlink and hardlink , these files helps us to create a shortcut or the backup
- In both softlink and hardlink if you update the source file it will automatically update the destination file 
- Using softlink we can reduce the utilization of space in our hard disk if you need same file in different location (it reduces the space as comapred to original file)
- We use softlink to create shortcuts for our scripts 

- echo "Hello world !" -> It is used to display or work as a print statement (it is a script)
- if the name of the script file is in green color then it has the execution permission, if not you can use chmod to change it
- To execute shell script this is used (./) -> ./filename

- which ls -> will tell where the ls is located currently means the path