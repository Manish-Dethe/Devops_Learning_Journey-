# EC2 Basics (Amazon EC2)
- EC2 = Elastic Compute Cloud (IaaS)
- One of the most popular AWS services  
- Provides virtual machines (instances)  

## Core Capabilities
- Renting virtual machines (EC2)  
- Storing data using EBS (Elastic Block Store)  
- Distributing load using ELB (Elastic Load Balancer)  
- Scaling using Auto Scaling Groups (ASG)  

- EC2 helps you understand how cloud infrastructure works 

# EC2 User Data
- It is possible to bootstrap our instances using an EC2 user data script 
## What is Bootstrapping?
- Running commands automatically at launch  
- Script runs only once at first start  
- Runs with root user  
## Use Cases
- Install updates  
- Install software  
- Download files  
- Configure system  

# EC2 Instance Types

## Naming Convention Example
m5.2xlarge
- m → instance class (general purpose)  
- 5 → generation  
- 2xlarge → size  

## 1. General Purpose
- Balanced compute, memory, networking  
- Use cases:
  - Web servers  
  - Code repositories  
- Example:
  - t2, t3, t4g, m5  

## 2. Compute Optimized
- High performance processors  
- Use cases:
  - Batch processing  
  - Media transcoding  
  - High performance web servers  
  - HPC (High Performance Computing)  
  - Machine learning  
- Example:
  - c5, c6g  

## 3. Memory Optimized
- Fast performance for large datasets in memory  
### Use cases:
- High performance databases  
- Distributed cache  
- In-memory databases (BI apps)  
- Real-time big data processing  
- Example:
  - r5, r6g, x1  

## 4. Storage Optimized
- High sequential read/write access  
### Use cases:
- OLTP systems  
- Cache for in-memory databases (ex- redis)
- Databases (SQL / NoSQL)  
- Data warehousing  
- Distributed file systems  

# Security Groups (AWS Firewall)
- Fundamental of AWS network security  
- Attached to EC2 instances  
## Key Features
- Control inbound and outbound traffic  
- Only contain **ALLOW rules** (no deny)  
- Rules can be based on:
  - IP address  
  - Other security groups 

## Types of Rules
### Inbound Rules
- Traffic coming into instance  
### Outbound Rules
- Traffic leaving instance  

## Important
- Security groups act as a **virtual firewall**  

# Security Groups Deep Understanding
- Security groups act as a firewall for EC2 instances  
## What They Control
- Access to ports  
- Authorized IP ranges (IPv4 / IPv6)  
- Inbound and outbound network traffic  

## Important Notes
- Multiple security groups can be attached to one instance  
- Locked down to region/VPC  

## Troubleshooting
### 1. Connection Refused
- Application not running  
### 2. Timeout Error
- Security group blocking traffic  

## Rules Behavior
- All inbound traffic is blocked by default  
- All outbound traffic is allowed by default  

# Common Ports to Know
- 22 → SSH (login to Linux)  
- 21 → FTP (file transfer)  
- 22 → SFTP (secure file transfer)  
- 80 → HTTP (web access)  
- 443 → HTTPS (secure web)  
- 3389 → RDP (Windows remote desktop)  