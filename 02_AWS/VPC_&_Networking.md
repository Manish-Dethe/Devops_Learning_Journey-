# VPC & Networking

## VPC Overview
At the AWS Certified Cloud Practitioner Level, you should know:
- VPC, Subnets, Internet Gateways & NAT Gateways
- Security Groups, Network ACL (NACL), VPC Flow Logs
- VPC Peering, VPC Endpoints
- Site to Site VPN & Direct Connect
- Transit Gateway

# IP Addresses in AWS
- IPv4 – Internet Protocol Version 4 (4.3 Billion Addresses)
- Public IPv4 → can be used on the Internet
- EC2 instance gets a new public IP address every time you stop then start it (default)
- Private IPv4 → can be used on private networks (LAN) such as internal AWS networking (e.g. 192.168.x.x)
- Private IPv4 is fixed for EC2 instances even if you start/stop them
- Elastic IP → allows you to attach a fixed public IPv4 address to EC2 instance
- Note: all public IPv4 on AWS will be charged $0.005 per hour (including EIP)
- IPv6 → Internet Protocol Version 6 (3.4 × 10^38 Addresses)
  - Every IP address is public in AWS (not private range)
  - Example: 2001:db8:3333:44:cc:dd:ee:ff
  - Free

# VPC, Subnet, Internet Gateway & NAT Gateways

# VPC & Subnet Primer
- VPC (Virtual Private Cloud): private network to deploy your resources (regional resource)
- Subnets allows you to partition your network inside your VPC (Availability Zone resource)
- A public subnet is a subnet that is accessible from the Internet
- A private subnet is a subnet that is not accessible from the Internet
- To define access to the Internet and between subnets, we use Route Table