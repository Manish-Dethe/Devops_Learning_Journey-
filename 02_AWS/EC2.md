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

# EC2 Purchasing Options

## 1. On-Demand Instances
- Pay for what you use (per second billing)  
- No long-term commitment  
### Best For:
- Short workloads  
- Unpredictable usage  
### Notes:
- Highest cost  
- No upfront payment  

## 2. Reserved Instances (RI)
- Commitment: 1 year or 3 years  
- Discount compared to on-demand  
### Payment Options:
- No upfront  
- Partial upfront  
- All upfront  
### Types:
- Standard RI → highest discount  
- Convertible RI → flexible (change instance type)  
### Scope:
- Regional or Zonal  

## 3. Savings Plans
- Similar to Reserved Instances  
- Commit to a usage ($/hour)  
### Benefits:
- Flexible across:
  - Instance types  
  - Regions  
  - OS  

## 4. Spot Instances
- Up to **90% cheaper** than on-demand  
- Can be terminated anytime by AWS  
### Best For:
- Batch jobs  
- Data processing  
- Image processing  
- Fault-tolerant workloads  
### Warning:
- Not suitable for critical workloads 

## 5. Dedicated Hosts
- Physical server fully dedicated to you  
### Benefits:
- Compliance requirements  
- Bring Your Own License (BYOL)  
### Notes:
- Most expensive option  

## 6. Dedicated Instances
- Instances run on dedicated hardware  
### Notes:
- May share hardware within same account  
- No control over exact placement  

## 7. EC2 Capacity Reservations
- Reserve capacity in a specific Availability Zone  
## Features
- Always available when needed  
- No time commitment  
- Can create or cancel anytime  
## Important
- No billing discounts  
- Can combine with Reserved Instances or Savings Plans for cost savings  

# Shared Responsibility Model (EC2)

## AWS Responsibility (Security OF Cloud)
- Infrastructure (global network security)  
- Isolation on physical hosts  
- Replacing faulty hardware  
- Compliance validation  

## Customer Responsibility (Security IN Cloud)
- Security group rules  
- OS patching and updates  
- Installed software and configurations  
- IAM roles and access management  
- Data security inside instance  

# EC2 Summary

## EC2 Instance Components
- AMI (Operating System)  
- Instance size (CPU + RAM)  
- Storage (EBS)  
- Security Groups  
- User Data (bootstrap script)  
## Security Groups
- Act as firewall for EC2  
## EC2 User Data
- Script runs at first launch  
## Access
- SSH → Port 22 (Linux access)  
## IAM Role
- Used to connect EC2 with AWS services securely  
## Purchasing Options
- On-demand  
- Reserved  
- Spot  
- Savings Plans  
- Dedicated Host  
- Dedicated Instance  