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