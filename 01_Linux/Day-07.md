# Day 7- 

## Topics Covered
- Collect network info
- Telnet
- Service

## Commands Practiced
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

## Notes
- Dont change hostname when you are in real time world because it has some DNS name if you change it then it may not communicate with the external network be cautious while using it
- ping is used to check weather other server is accessible from this network or not and if it is in the same network weather server is up and running or not
- In a server we can run multiple applications, but each application has to be identified one number that number is port number, in the server the applications runs on port number

| Port Number | Service |
|------------|--------|
| 21         | FTP    |
| 22         | SSH    |
| 23         | TELNET |
| 25         | SMTP   |
| 53         | DNS    |
| 80         | HTTP   |
| 443        | HTTPS  |

## Service
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
 
- You can access the port number on the browser
- cat /var/www/html -> In this location it is going to look for the application

## SSH
- THe SSH protocol (also refferd to a secure shell) is a method for secure remote login from one computer to another. It provides several alternatives options for strong authentication, and it protects the communications security and integrity with strong encryption
