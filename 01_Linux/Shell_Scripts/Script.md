## Scripts
- Contain a series of command
- An interpreter executes commands in the script
- Anything you can type at the command line, you can put in a script
- Great for automating tasks
- The first line of the script start with shebang followed by the path to an interpreter that will be execute command in the script

# script.sh
- (#!/bin/bash)
- echo "Scripting is fun!" -> Before executing it make sure it has executable bits set (chmod 755)
- If file is in your path then you can directly write the name of the file, otherwise you have to use ./ (./script.sh)
- (#! -> Sharp Bang) -> Shebang -> Interpreter is executed and the path used to call the script is passed as a argument to the interpreter

# Sheband or Not to Shebang
- If a script does not contain a shebang the commands are executed using your shell
- Different shells have slightly varying syntax

## Variables
- Storage locations that have a name
- Name-value pairs
- Syntax: variable_name = "Value"
- Variables are case sensitive
- By convention variables are upercase
- $Variable_name OR ${Variable_name} you can use in echo for printing it

## Assign command output to a variable
- SERVER_NAME = $ (hostname) OR `hostname` (older syntax)
  echo "You are running this script on $ (SERVER_NAME)"
  Output -> You are running this script on linuxsvr

## File Operators (If you are using tha bash shell)
- -d FILE -> True if file is a directory
- -e FILE -> True if file exits
- -f FILE -> True if file exits and is a regular file
- -r FILE -> True if file is readable by you
- -s FILE -> True if file exits and is not empty
- -w FILE -> True if the file is writable for you
- -x FILE -> True if the file is executable by you

## String Operators
- -z STRING -> True if string is empty
- -n STRING -> True if string is not empty
- STRING1 = STRING2 -> True if the strings ae equal
- STRING1 != STRING2 -> True if the stings are not equal

## Arithmetic Operators (tests)
- arg1 -eq arg2 -> True if arg1 is equal to arg2
- arg1 -ne arg2 -> True if arg1 is not equal to arg2
- arg1 -lt arg2 -> True if arg1 is less than arg2
- arg1 -le arg2 -> True if arg1 is less than or equal to arg2
- arg1 -gt arg2 -> True if arg1 is greater than arg2
- arg1 -ge arg2 -> True if arg1 is greater than or equal to arg2

## Making Decisions - The if statement
- if [ condtion-is-true ] 
  then
    command1
    command2
  fi

# if/else
- if [ condtion-is-true ] 
  then
    command1
  else
    command2
  fi

# if/elif/else
- if [ condtion-is-true ] 
  then
    command1
  elif [ condition-is-true ]
  then
    command2
  else
    command3
  fi

## For 
- for VARIABLE_NAME in ITEM_1 ITEM_N
  do
    command1
    command2
  done

## Positional Parameters
- $ script.sh parameter1 parameter2 parameter3, (variables are $0 to $9)
- $0 : "script.sh"
- $1 : "parameter1"
- $2 : "parameter2"
- $3 : "parameter3"
- $@ -> To access all the items on the command line starting at the first parameter($1)
- (#) -> To add comments in the script

## Accepting User Input (STDIN)
- The read command accepts STDIN
- Syntax: read -p "PROMPT" VARIABLE

## Exit Status / Return Code
- Every command returns an exit status
- Range fromm 0 to 255
- 0 = Success
- Other than 0 = error condition
- Use for error checking
- Use man or info to find meaning of exit status

## Checking the Exit Status
- $? contains the return code of the previously executed command
- ls /not/here
- echo "$?" -> Output : 2

```bash
HOST="google.com"

ping -c 1 $HOST

if [ "$?" -eq "0" ]
then
    echo "$HOST reachable."
else
    echo "$HOST unreachable."
fi
```

## && and ||
# && = AND
- mkdir /tmp/bak && cp test.txt /tmp/bak/

# || = OR
- cp test.txt /tmp/bak/ || cp test.txt /tmp

## The semicolon
- Seperate commands with a semicolon to ensure they all get executed
- cp test.txt /tmp/bak/ ; cp test.txt /tmp
- Same as:
- cp test.txt /tmp/bak
- cp test.txt /tmp

## Exit Command
- Explicitly define the return code (exit 0, exit 1, exit 2, exit 255, etc)
- The default value is that of the last command executed

```bash
#!/bin/bash

HOST="google.com"

ping -c 1 $HOST

if [ "$?" -ne "0" ]
then
    echo "$HOST unreachable."
    exit 1
fi

exit 0
```

## Functions
- If you are repeating yourself, use a function.
- Reusuable code.
- Must be defined before use.
- Has parameter support.

## Creating a function
- function function-name() {
  # code 
}

- function-name() {
  # code
}

## Calling a function
```bash
#!/bin/bash
function hello() {
  echo "Hello!"
}
hello
```

## FUnctions can call other functions
``` bash
#!/bin/bash
function hello() {
  echo "Hello!"
  now
}
function now() {
  echo "It's $(date +%r)"
}
hello
```

## Positional Parameters
- Functions can accept parameters.
- The first parameter is stired in $1
- The second parameter is stored in $2, etc
- $@ contains all of the parameters
- Just like shell scripts ($0 = the script itself, not function name)

```bash
#!/bin/bash
function hello() {
  echo "Hello $1"
}
hello Jason
```

```bash
#!/bin/bash
function hello() {
  for NAME in $@
  do
    echo "Hello $NAME"
  done
}
hello Jason Dan Ryan
```

## Variable Scope
- By default, variables are global
- Variables have to be defined before used

## Local Variables
- Can only be accesses within the function
- Create using the local keyword
- local LOCAL_VAR = 1
- Only functions can have local variables
- Best practice to keep variables local in functions

## Exit Status
- Functions have an exit status
- Explicitly (return <RETURB_CODE>)
- Implicity (The exit status of the last command executed in the function)
- Valid exit codes range from 0 to 255
- 0 = success
- $? = the exit status

## Wildcards
- A character or string used for pattern matching.
- Globbing expands the wildcard pattern into a list of files and/or directories. (paths)
- Wildcards can be used with most commands (ls, rm, cp).

- *- matches zero or more characters
 1. *.txt
 2. a*
 3. a*.txt

- ?- matches exactly one character
 1. ?.txt
 2. a?
 3. a?.txt

## More Wildcards - Character Classes

# [] - A character class
- Matches any of the characters included between the brackets. Matches exactly one character
- [aeiou]
- ca[nt]* -> (can, cat, candy, catch)

# [!]
- Matches any of the characters NOT included between the brackets. Matches exactly one character
- [!aeiou]* -> (baseball, cricket)

# Ranges
- Use two characters seperated by a hyphen to create a range in a character class.
- [a-g]* -> Matches all files that start with a,b,c,d,e,f or g.
- [3-6]* -> Matches all files that start with 3,4,5 or 6.

# Named Character Classes
- [[:alpha:]]
- [[:alnum:]]
- [[:digit:]]
- [[:lower:]]
- [[:space:]]
- [[:upper:]]

# Matching Wildcard patterns
- \- escape character. Use if you want to match a wildcard character
- Match all files that end with the question mark: *\? -> done? (filename)
 
# Case Satements
- Alternative to if statements
 if["$VAR"="one"]
 elif["$VAR"="two"]
 elif["$VAR"="three"]
 elif["$VAR"="four"]
- May be easier to read that complex if statements.

```bash
case "$VAR" in
    pattern_1)
        # Commands go here.
        ;;
    pattern_N)
        # Commands go here.
        ;;
esac
```

```bash
case "$1" in
    start)
        /usr/sbin/sshd
        ;;
    stop)
        kill $(cat /var/run/sshd.pid)
        ;;
esac
```

```bash
case "$1" in
    start|START)
        /usr/sbin/sshd
        ;;
    stop|STOP)
        kill $(cat /var/run/sshd.pid)
        ;;
    *)
        echo "Usage: $0 start|stop" ; exit 1
        ;;
esac
```

```bash
read -p "Enter y or n: " ANSWER

case "$ANSWER" in
    [yY] | [yY][eE][sS])
        echo "You answered yes."
        ;;
    [nN] | [nN][oO])
        echo "You answered no."
        ;;
    *)
        echo "Invalid answer."
        ;;
esac
```

```bash
read -p "Enter y or n: " ANSWER

case "$ANSWER" in
    [yY]*)
        echo "You answered yes."
        ;;
    *)
        echo "You answered something else."
        ;;
esac
```

# Logging
- Logs are the who, what, when, where, and why.
- Output may scroll off the screen.
- Script may run unattended (via cron, etc.).

## Syslog
- The syslog standard uses facilities and severities to categorize messages.
  - **Facilities:** kern, user, mail, daemon, auth, local0, local7
  - **Severities:** emerg, alert, crit, err, warning, notice, info, debug

- Log file locations are configurable:
  - `/var/log/messages`
  - `/var/log/syslog`

## Logging with logger
- The logger utility
- By default creates `user.notice` messages.

```bash
logger "Message"

logger -p local0.info "Message"

logger -t myscript -p local0.info "Message"

logger -i -t myscript "Message"
```

```bash
logit () {
    local LOG_LEVEL=$1
    shift
    MSG=$@
    TIMESTAMP=$(date +"%Y-%m-%d %T")
    if [ $LOG_LEVEL = 'ERROR' ] || $VERBOSE
    then
        echo "${TIMESTAMP} ${HOST}
${PROGRAM_NAME} [${PID}]: ${LOG_LEVEL} ${MSG}"
    fi
}
```
```bash
logit INFO "Processing data."

fetch-data $HOST || logit ERROR "Could not
fetch data from $HOST"
```

# While Loop Format

```bash
while [ CONDITION_IS_TRUE ]
do
    command 1
    command 2
    command N
done
```

## Infinite Loops

```bash
while [ CONDITION_IS_TRUE ]
do
    # Commands do NOT change
    # the condition
    command N
done
```

```bash
while true
do
    command N
    sleep 1
done
```
## Example - Loop 5 Times

```bash
INDEX=1

while [ $INDEX -lt 6 ]
do
    echo "Creating project-${INDEX}"
    mkdir /usr/local/project-${INDEX}

    ((INDEX++))
done
```
## Output - Loop 5 Times
```text
Creating project-1
Creating project-2
Creating project-3
Creating project-4
Creating project-5
```

## Example - Checking User Input

```bash
while [ "$CORRECT" != "y" ]
do
    read -p "Enter your name: " NAME
    read -p "Is ${NAME} correct? " CORRECT
done
```

## Output - Checking User Input
```text
Enter your name: Luke Skywalker
Is Luke Skywalker correct? n
Enter your name: Jason
Is Jason correct? y
```

## Example - Return Code of Command

```bash
while ping -c 1 app1 >/dev/null
do
    echo "app1 still up..."
    sleep 5
done

echo "app1 down, continuing."
```
## Output - Return Code of Command
```text
app1 still up...
app1 still up...
app1 still up...
app1 still up...
app1 still up...
app1 down, continuing.
```

## Reading a file, line-by-line

```bash
LINE_NUM=1

while read LINE
do
    echo "${LINE_NUM}: ${LINE}"
    ((LINE_NUM++))
done < /etc/fstab
```

```bash
grep xfs /etc/fstab | while read LINE
do
    echo "xfs: ${LINE}"
done
```

```bash
FS_NUM=1

grep xfs /etc/fstab | while read FS MP REST
do
    echo "${FS_NUM}: file system: ${FS}"
    echo "${FS_NUM}: mount point: ${MP}"
    ((FS_NUM++))
done
```

```bash
while true
do
    read -p "1: Show disk usage. 2: Show uptime. " CHOICE

    case "$CHOICE" in
        1)
            df -h
            ;;
        2)
            uptime
            ;;
        *)
            break
            ;;
    esac
done
```

```bash
mysql -BNe 'show databases' | while read DB
do
    db-backed-up-recently $DB
    if [ "$?" -eq "0" ]
    then
        continue
    fi
    backup $DB
done
```

## Debugging
- A bug is really an error.
- Examine the inner workings of your script.
- Determine the root of unexpected behavior.
- Fix bugs (errors).

## Built in Debugging Help

- `-x` = Prints commands as they execute.
- After substitutions and expansions.
- Called an **x-trace**, **tracing**, or **print debugging**.
- `#!/bin/bash -x`
- `set -x`
  - `set +x` to stop debugging.

```bash
#!/bin/bash -x

set -x

# Your commands go here

set +x
```
## Debugging Example

```bash
#!/bin/bash -x
TEST_VAR="test"
echo "$TEST_VAR"
```

```text
+ TEST_VAR=test
+ echo test
test
```

```bash
#!/bin/bash
TEST_VAR="test"
set -x
echo $TEST_VAR
set +x
hostname
```

```text
+ echo test
test
+ set +x
linuxsvr
```
## Built in Debugging Help
- `-e` = Exit on error.
- Can be combined with other options.
  - `#!/bin/bash -ex`
  - `#!/bin/bash -xe`
  - `#!/bin/bash -e -x`
  - `#!/bin/bash -x -e`

```bash
#!/bin/bash -e
FILE_NAME="/not/here"
ls $FILE_NAME
echo $FILE_NAME
```

```text
ls: cannot access /not/here: No such file or directory
```

```bash
#!/bin/bash -ex
FILE_NAME="/not/here"
ls $FILE_NAME
echo $FILE_NAME
```

```text
+ FILE_NAME=/not/here
+ ls /not/here
ls: cannot access /not/here: No such file or directory
```

- `-v` = Prints shell input lines as they are read.
- Can be combined with other options.

```bash
#!/bin/bash -v
TEST_VAR="test"
echo "$TEST_VAR"
```

```text
#!/bin/bash -v
TEST_VAR="test"
echo "$TEST_VAR"
test
```

