# Day 4 - 

## Topics Covered
- Creating and managing the user
- Create password
- Is command explained
- File permission
- Changing permissions (chmod)
- Changing ownership (chown)

## Commands Practiced
- cat /etc/passwd -> Shows all the user, and their path
- sudo su -> going into the root user

## Use creation
- useradd john -> will create the user named john
- sudo adduser john -> will create user with home directory and all (worked in my linux)
- usermod -G john mark -> Will add the mark to the john group
- id mark -> show the details and id of mark

- Note : ex-> during docker setup we should add user to a docker group

## Create password
- passwd john -> Will create the password for the john user
- sudo passwd john

- nano /etc/ssh//sshd_config -> (If we are doing in aws server then there will be private key authentication, also the PasswordAuthentication is selected no so we have to open using nano and edit it (no->yes) so that we can use password, for that above command is their)
- service sshd reload -> If we update any configuration then we need to update(reload) our services

- su - john -> To go inside the john user (or sudo su - john)
- cd ~ -> To go in home directory


## Error occured
- I was in User(vboxuser) and was trying to create new user, but it was saying permission denied then i wrote sudo su and got in root (for creating new user we should be in root) after that i created new user

## Notes
- In linux there are three types of users.
  1. Super or root user: User is the most powerful user. He is administrator user.(Type->Super user,Ex->Root,Home Directory->/root,Shell->/bin/bash)
  2. System user: Users creted by the softwares or applications.(Type->System User,Ex->ftp,ssh,apache,Home Directory->/var/ftp,etc,Shell->/sbin/nologin (we cannot have shell for this system thats why no login will come))
  3. Normal user: Normal users are the users created by root user.(Type->Normal user,Ex->visitor,ec2-user,Home Directory->/home/username,Shell->/bin/bash)

- User Creation -> Whenevr a user is created in linux, below things happen by default
 1. A home directory is created(/home/username)
 2. unique UID(user id) & GID(Group id) are given to user
 3. An entry in /etc/passwd
 4. Whenever we create user by default with the same name one group gets create and user is added as a part of this group

 Syntax -> # useradd <option> <username>
 options are: 1. -u user id, 2. -G Secondary group id, 3. -g primary group id, 4. -d home directory, 5. -c comment, 6. -s shell

- All user related information is stored in (cat /etc/passwd)

## File permission
- Permission are applied at 3 levels
 1. Owner or User level
 2. Group level
 3. Others level

- Permissions are applied in 3 ways
 1. r -> Read only
 2. w -> Write/Edit/Append/Delete
 3. x -> Execute/Run

 - Unix/Linux files have 8 attributes that can be seen with ls -l command

 - File types
 | Symbol | File Type        |
 |--------|------------------|
 | -      | Regular file     |
 | d      | Directory        |
 | b      | Block device     |
 | c      | Character device |
 | l      | Symbolic link    |

 - ls -ld /home/john -> Permissions for the directory

## Changing permissions
- Permission can be set on any file/dir by using two methods:- 
 1. Symbolic method (ugo)  , chmod(Change mode)
  - chmod [who] [+/-/=] [permissions] file
  who : To whom the permissions to be assigned
  Permissions: User/owner (u); group (g); others (o)
  ex :- chmod u=rwx,g=rw,o=r <file_name>
        chmod ugo=rwx <file_name>

  - chmod u+x file1 -> will give the user permission to execute
  - chod u+x,g-w,o=w file1 -> will give the user permission to execute, remove the write permission for group, give the other to write permission


 2. Absolute method (numbers) - use numbers instead of using symbols
  Read-4, Write-2, Execute-1
  ex :- chmod 764 <file_name>
        chmod 777 <file_name>

## Change Ownership
- chown john:john file2 -> will change the owner to john and group to john of file2
- chown john file3 -> will only change the ownership to john

- - file file1 -> Simply tells what type of file it is (ASCII text, directory, character, block or linked file)