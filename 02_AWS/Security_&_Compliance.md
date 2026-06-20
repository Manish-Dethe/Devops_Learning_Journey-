# Security & Compliance

# Shared Responsibility Model
- AWS responsibility - security of the cloud
  - Protecting infrastructure (hardware, software, facilities, and networking) that runs all the AWS services
  - Managed services like S3, DynamoDB, RDS, etc.

- Customer responsibility - Security in the cloud
  - For EC2 instance, customer is responsible for management of the guest OS (including security patches and updates), firewall & network configuration, IAM
  - Encrypting application data

- Shared controls:
  - Patch management, configuration management, Awareness & Training

# Ex for RDS
- AWS responsibility
  - Manage the underlying EC2 instance, disable SSH access
  - Automated DB patching
  - Automated OS patching
  - Audit the underlying instance and disks & guarantee it functions

- Your responsibility
  - Check the ports / IP / security group inbound rules in DB's SG
  - In database user creation and permissions
  - Creating a database with or without public access
  - Ensure parameter groups or DB is configured to only allow SSL connections
  - Database encryption setting

# Ex for S3
- AWS responsibility
  - Guarantee you get unlimited storage
  - Guarantee you get encryption
  - Ensure separation of the data between different customers
  - Ensure AWS employees can't access your data

- Your responsibility
  - Bucket configuration
  - Bucket policy / public setting
  - IAM user and roles
  - Enabling encryption

# DDoS Protection : WAF & Shield
- AWS Shield Standard : protects against DDOS attack for your website and applications, for all customers at no additional costs
- AWS Shield Advanced : 24/7 premium DDOS protection
- AWS WAF : Filter specific requests based on rules
- CloudFront and Route 53 :
  - Availability protection using global edge network
  - Combined with AWS shield, provides attack mitigation at the edge
- Be ready to scale - leverage AWS Auto Scaling

## AWS Shield

### AWS Shield Standard
- Free service that is activated for every AWS customer
- Provides protection from attacks such as SYN / UDP Floods, Reflection attacks and other layer 3 / layer 4 attacks

### AWS Shield Advanced
- Optional DDOS mitigation service ($ 3000 per month per organization)
- Protect against more sophisticated attack on Amazon EC2, Elastic Load Balancing (ELB), Amazon CloudFront, AWS Global Accelerator, and Route 53
- 24/7 access to AWS DDOS response team (DRP)
- Protect against higher fees during usage spikes due to DDOS

## AWS WAF - Web Application Firewall
- Protects your web application from common web exploits (Layer 7)
- Layer 7 is HTTP (vs Layer 4 is TCP)
- Deploy on Application Load Balancer, API Gateway, CloudFront
- Define Web ACL (Web access control list)
  - Rule can include IP addresses, HTTP headers, HTTP body, or URI Strings
- Protects from common attack - SQL injection and cross-site scripting (XSS)
- Size constraints, geo-match (block countries)
- Rate based rules (to count occurrences of events) - for DDOS protection

# AWS Network Firewall
- Protect your entire Amazon VPC
- From Layer 3 to Layer 7 protection
- Any direction, you can inspect
  - VPC to VPC traffic
  - Outbound to internet
  - Inbound from internet
  - To / From Direct Connect & Site to Site VPN

# AWS Firewall Manager
- Manage security rules in all accounts of an AWS organization
- Security policy : common set of security rules
  - VPC Security Groups for EC2, Application Load Balancer, etc
  - WAF rules
  - AWS Shield Advanced
  - AWS Network Firewall
- Rules are applied to new resources as they are created (good for compliance) across all and future accounts in your organization

# Penetration Testing on AWS Cloud
- AWS customers are welcome to carry out security assessments or penetration test against their AWS infrastructure without prior approval for 8 services :
  - Amazon EC2 instances, NAT Gateways, and Elastic Load Balancers
  - Amazon RDS
  - Amazon CloudFront
  - Amazon Aurora
  - Amazon API Gateways
  - AWS Lambda and Lambda Edge functions
  - Amazon Lightsail resources
  - Amazon Elastic Beanstalk environments

- Prohibited Activities
  - DNS zone walking via Amazon Route 53 hosted zones
  - Denial of Service (DoS), Distributed Denial of Service (DDoS), simulated DoS, simulated DDoS
  - Port flooding
  - Protocol flooding
  - Request flooding (login request flooding, API request flooding)

# Encryption with KMS & Cloud HSM

## Data at rest vs Data in transit
- At rest : data stored or archived on a device
  - on a hard disk, on a RDS instance, in S3 Glacier Deep Archive, etc.
- In transit (in motion) : data being moved from one location to another
  - Transfer from on-premises to AWS, EC2 to DynamoDB, etc
  - Means data transferred on the network
- We want to encrypt data in both states to protect it !
- For this we leverage encryption keys

# AWS KMS (Key Management Service)
- Anytime you hear "encryption" for an AWS service, it's most likely KMS
- KMS = AWS manage the encryption keys for us
- Encryption opt-in :
  - EBS Volumes : encrypt volumes
  - S3 buckets : service-side encryption of objects (SSE-S3 enabled by default, SSE-KMS opt in)
  - Redshift database : encryption of data
  - RDS database : encryption of data
  - EFS drives : encryption of data
- Encryption Automatically enabled :
  - CloudTrail Logs
  - S3 Glacier