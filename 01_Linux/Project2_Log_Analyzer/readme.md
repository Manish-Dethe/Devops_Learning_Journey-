# Linux Project 2: Log Analyzer

## Objective
The goal of this project is to analyze log files and extract useful information like errors and warnings using Linux commands.

## What I Did
* Created a log file (`app.log`) with different types of logs
* Used grep to filter important log messages
* Extracted ERROR and WARNING logs
* Counted number of errors
* Performed case-insensitive searches

## Log Analysis Performed
* Found all ERROR logs
* Found all WARNING logs
* Counted total ERROR occurrences
* Searched logs ignoring case sensitivity
* Found logs starting with specific patterns

## What I Learned
* How to analyze logs in Linux
* Usage of grep for filtering data
* Importance of logs in debugging systems
* Real-world DevOps troubleshooting approach

## Project Structure
* app.log → contains sample log data

## 🔧 Commands Used

* View full log file
  `cat app.log`
* Find all ERROR logs
  `grep "ERROR" app.log`
* Find all WARNING logs
  `grep "WARNING" app.log`
* Count total ERROR occurrences
  `grep -c "ERROR" app.log`
* Case-insensitive search
  `grep -i "error" app.log`
* Find logs starting with ERROR
  `grep "^ERROR" app.log`
* Search specific keyword (e.g., failed)
  `grep "failed" app.log`
* Show line numbers with ERROR
  `grep -n "ERROR" app.log`

## Conclusion
This project helped me understand how log analysis works in real DevOps environments and how to quickly find issues using command-line tools.
