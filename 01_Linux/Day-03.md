# Day 3 - 

## Topics Covered
- Copy files or directories
- Move or rename a file
- Change directory
- How to search a file
- Search a word in a file
- Replace a word in a file

## Commands Practiced

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

## Notes
- If we copy the data from file to directory then first it will check wheather the file is present in directory or not, if it is present it will do nothing and if it is not present then it will simply copy the file to the directory
- cp command is not able to copy file from directory to directory ,but we can use flags for that (cp -R dir1 dir2), also if the dir2 is not created it will create the dir2
- We cannot copy a directory into a file
- If you are staring your path from / , like(/root/dir1) then it is the absolute path
- For directory we cannot use cat we have to use cd -> just for going inside any directory
- Whenever we use flags we get extra features
- | (pipe) -> It is used to combine two or more commands

- you can use esc and after that d/word , word refer to upto which line you have to delete