# Day 2 - 

## Topics Covered
- Basic Linux Commands
- Read a file
- Create a file
- Edit or append content to a file
- Create Directories
- Remove files and directories

## Commands Practiced

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
- ls -l -t -> gives the detail information of the file, sorted by most recently modified, t means timestamp(file which are created recently will be shown above)
- ls -l -t -r -> gives the detail information of the file, sorted by most recently modified in reverse order
- ls -ltr -> all the three combined
- cat > filename -> create file and allow to write inside the file
- cat >> filename -> if we add some data then it will be appended to the file without removing the old one.
- cat filename -> used to open the file
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

## Notes
- Flag(-) -> with this symbol whatever will be written is flag and this is used to tell how to modify the answer based on the flag used
- cat > file1 -> if some data is present in the file1 then it will overwrite that data, if file1 is empty then its ok
- In listing the files, if it starts from - then it is a file and if it starts from d then it is the directory
- If i do mkdir dir1 dir2 dir3 , i can create the sub directories at a time
- If we delete using rm,  then their is no recycle bin in linux but in windows it can be recycled

- For nano -> To open - nano filename, To save(write) - Ctrl + O, To exit -> Ctrl + X
