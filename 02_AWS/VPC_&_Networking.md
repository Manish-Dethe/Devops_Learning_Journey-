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

# Internet Gateway & NAT Gateways
- Internet Gateway helps our VPC instances connect with the Internet
- Public subnets have a route to the Internet Gateway
- NAT Gateways (AWS-managed) & NAT Instances (self managed) allow your instances in your private subnets to access the Internet while remaining private

# Network ACL & Security Groups
- NACL (Network ACL)
  - A firewall which controls traffic from and to subnet
  - Can have ALLOW and DENY rules
  - Are attached at the subnet level
  - Rules only include IP addresses

- Security Groups
  - A firewall that controls traffic to and from an EC2 Instance
  - Can have only ALLOW rules
  - Rules include IP addresses and other security groups

# Network ACLs vs Security Groups
- Network ACL
  - Operates at the subnet level
  - Supports allow rules and deny rules
  - Is stateless: Return traffic must be explicitly allowed by rules

- Security Group
  - Operates at the instance level
  - Supports allow rules only
  - Is stateful: Return traffic is automatically allowed, regardless of any rules

# VPC Flow Logs
- Capture information about IP traffic going into your interfaces
  - VPC Flow Logs
  - Subnet Flow Logs
  - Elastic Network Interface Flow Logs
- Helps to monitor & troubleshoot connectivity issues. Ex:
  - Subnets to Internet
  - Subnets to subnets
  - Internet to subnets
- Captures network information from AWS managed interfaces too: Elastic Load Balancers, ElastiCache, RDS, Aurora, etc
- VPC Flow Logs data can go to S3, CloudWatch Logs, and Amazon Data Firehose

# VPC Peering
- Connect two VPC, privately using AWS network
- Make them behave as if they were in the same network
- Must not have overlapping CIDR (IP address range)
- VPC peering connection is not transitive (must be established for each VPC that need to communicate with one another)

# VPC Endpoints
- Endpoints allow you to connect to AWS services using a private network instead of the public WWW network
- This gives you enhanced security and lower latency to access AWS services
- VPC Endpoint Gateway: S3 & DynamoDB
- VPC Endpoint Interface: most services (including S3 & DynamoDB)

# AWS PrivateLink (VPC Endpoint Services)
- Most secure & scalable way to expose a service to 1000s of VPCs
- Does not require VPC peering, internet gateway, NAT, route tables
- Requires a Network Load Balancer (service VPC) and ENI (customer VPC)

# Site to Site VPN & Direct Connect
- Site to Site VPN
  - Connects an on premises VPN to AWS
  - The connection is automatically encrypted
  - Goes over the public internet

- Direct Connect (DX)
  - Establish a physical connection between on premises & AWS
  - The connection is private, secure and fast
  - Goes over a private network
  - Takes at least a month to establish

- Site to Site VPN
  - On premises : must use a Customer Gateway (CGW)
  - AWS : must use a Virtual Private Gateway (VGW)

# AWS Client VPN
- Connect from your computer using OpenVPN to your private network in AWS and on-premises
- Allow you to connect to your EC2 instances over a private IP (just as if you were in the private VPC network)
- Goes over public internet

# Transit Gateway
- For having transitive peering between thousands of VPC and on-premises, hub and spoke (star) connection
- One single Gateway to provide this functionality
- Works with Direct Connect Gateway, VPN connections

# VPC & Networking Summary
- VPC : Virtual Private Cloud
- Subnets : Tied to an AZ, network partition of the VPC
- Internet Gateway : at the VPC level, provide Internet Access
- NAT Gateway / Instances : give internet access to private subnets
- NACL : stateless, subnet rules for inbound and outbound
- Security Groups : stateful, operate at the EC2 instance level or ENI
- VPC Peering : connect two VPC with non overlapping IP ranges, non-transitive
- Elastic IP : fixed public IPv4, ongoing cost if not in use
- VPC Endpoints : provide private access to AWS services within VPC
- PrivateLink : privately connect to a service in a 3rd party VPC
- VPC Flow Logs : network traffic logs
- Site to Site VPN : VPN over public internet between on-premises DC and AWS
- Client VPN : OpenVPN connection from your computer into your VPC
- Direct Connect : dedicated private connection to AWS
- Transit Gateway : connect thousands of VPC and on-premises networks together