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

# Cloud HSM
- KMS -> AWS manages the software for encryption
- CloudHSM -> AWS provisions encryption hardware
- Dedicated Hardware (HSM = Hardware Security Module)
- You manage your own encryption keys entirely (not AWS)
- HSM device is tamper resistant, FIPS 140-2 Level 3 compliant

# Types of KMS Keys

## Customer Managed Key
- Create, manage and used by the customer, can enable or disable
- Possibility of rotation policy (new key generated every year, old key preserved)
- Possibility to bring your own key

## AWS Managed Key
- Created, managed and used on the customer's behalf by AWS
- Used by AWS services (aws/s3, aws/ebs, aws/redshift)

## AWS Owned Key
- Collection of CMKs that an AWS service owns and manage to use in multiple accounts
- AWS can use those to protect resources in your account (but you can't view the keys)

## CloudHSM Keys (Custom Keystore)
- Keys generated from your own CloudHSM hardware device
- Cryptographic operations are performed within the CloudHSM cluster

# AWS Certificate Manager (ACM)
- Lets you easily provision, manage and deploy SSL/TLS certificates
- Used to provide in-flight encryption for websites (HTTPS)
- Support both public and private TLS certificates
- Free of charge for public TLS certificates
- Automatic TLS certificate renewal
- Integrations with (load TLS certificates on)
  - Elastic Load Balancers
  - CloudFront Distributions
  - APIs on API Gateway

# AWS Secrets Manager
- Newer service, meant for storing secrets
- Capability to force rotation of secrets every X days
- Automate generation of secrets on rotation (use Lambda)
- Integration with Amazon RDS (MySQL, PostgreSQL, Aurora)
- Secrets are encrypted using KMS
- Mostly meant for RDS integration

# AWS Artifact (not really a service)
- Portal that provides customer with on demand access to AWS compliance documentation and AWS agreements
- AWS Reports - Allow you to download AWS security and compliance documents from third party auditors, like AWS ISO certifications, Payment Card Industry (PCI), and System and Organization Control (SOC) reports
- Artifact Agreements - Allow you to review, accept and track the status of AWS agreements such as the Business Associate Addendum (BAA) or the Health Insurance Portability and Accountability Act (HIPAA) for an individual account or in your organization
- Can be used to support internal audit or compliance

# Amazon GuardDuty
- Intelligent Threat discovery to protect your AWS account
- Uses Machine Learning algorithms, anomaly detection, 3rd party data
- One click to enable (30 days trial), no need to install software
- Input data includes:
  - CloudTrail Events logs - unusual API calls, unauthorized deployments
    - CloudTrail Management Events - create VPC subnet, create trail...
    - CloudTrail S3 Data Events - get object, list objects, delete objects..
  - VPC Flow Logs - unusual internal traffic, unusual IP address
  - DNS Logs - compromised EC2 instances sending encoded data within DNS queries
- Optional Features - EKS Audit logs, RDS & Aurora, EBS, Lambda, S3 Data Events
- Can setup EventBridge rules to be notified in case of findings
- EventBridge rules can target AWS Lambda or SNS
- Can protect against cryptocurrency attacks (has a dedicated "finding" for it)

- VPC Flow Logs
- CloudTrail Logs
- DNS Logs (AWS DNS)
- Optional Features
- S3 Logs, EBS Volumes
- Lambda Network Activity
- RDS & Aurora Login Activity
- EKS Audit Logs & Runtime Monitoring

GuardDuty -> EventBridge

- SNS
- Lambda

# Amazon Inspector
- Automated Security Assessments
- For EC2 instances
  - Leveraging the AWS System Manager (SSM) agent
  - Analyze against unintended network accessibility
  - Analyze the running OS against known vulnerabilities
- For container images push to Amazon ECR
  - Assessment of container images as they are pushed
- For Lambda Functions
  - Identifies software vulnerabilities in function code and package dependencies
  - Assessment of functions as they are deployed
- Reporting and integration with AWS Security Hub
- Send findings to Amazon Event Bridge

# What does Amazon Inspector evaluate?
- Remember: only for EC2 instances, container images & Lambda functions
- Continuous scanning of the infrastructure, only when needed
- Package vulnerabilities (EC2, ECR & Lambda) - database of CVE
- Network reachability (EC2)
- A risk score is associated with all vulnerabilities for prioritization

# AWS Config
- Helps with auditing and recording compliance of your AWS resources
- Helps record configurations and changes over time
- Possibility of storing the configuration data into S3 (analyzed by Athena)
- Questions that can be solved by AWS Config:
  - Is there unrestricted SSH access to my security groups?
  - Do my buckets have any public access?
  - How has my ALB configuration changed over time?
- You can receive alerts (SNS notifications) for any changes
- AWS Config is a per-region service
- Can be aggregated across regions and accounts

## Config Resources
- View compliance of a resource over time
- View configuration of a resource over time
- View CloudTrail API calls if enabled

# Amazon Macie
- Amazon Macie is a fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data in AWS
- Macie helps identify and alert you to sensitive data, such as Personally Identifiable Information (PII)
Flow:
S3 Bucket → Macie (Analyze) → Discover Sensitive Data (PII) → Amazon EventBridge (Notify) → Integrations

# AWS Security Hub
- Central security tool to manage security across several AWS accounts and automate security checks
- Integrated dashboards showing current security and compliance status to quickly take actions
- Automatically aggregates alerts in predefined or personal findings format from various AWS services & AWS partner tools:
  - AWS Config
  - GuardDuty
  - Inspector
  - Macie
  - IAM Access Analyzer
  - AWS Systems Manager
  - AWS Firewall Manager
  - AWS Health
  - AWS Partner Network solutions
- Must first enable the AWS Config service

# Amazon Detective
- GuardDuty, Macie and Security Hub are used to identify potential security issues, or findings
- Sometimes security findings require deeper analysis to isolate the root cause and take action - it's a complex process
- Amazon Detective analyzes, investigates, and quickly identifies the root cause of security issues or suspicious activities (using ML and graphs)
- Automatically collects and processes events from:
  - VPC Flow Logs
  - CloudTrail
  - GuardDuty
- Creates a unified view
- Produces visualizations with details and context to get to the root cause

# AWS Abuse
- Report suspected AWS resources used for abusive or illegal purposes

## Abusive & prohibited behaviors are:
- Spam
  - Receiving undesired emails from AWS-owned IP addresses
  - Websites & forums spammed by AWS resources
- Port Scanning
  - Sending packets to your ports to discover unsecured/open ports
- DoS or DDoS Attacks
  - AWS-owned IP addresses attempting to overwhelm or crash your servers/software
- Intrusion Attempts
  - Logging in to your resources without authorization
- Hosting Objectionable or Copyrighted Content
  - Distributing illegal or copyrighted content without consent
- Distributing Malware
  - AWS resources distributing software designed to harm computers or machines

# Root User Privileges
- Root User = Account Owner (created when the AWS account is created)
- Has complete access to all AWS services and resources
- Lock away your AWS account root user access keys
- Do not use the root account for everyday tasks, even administrative tasks

## Actions that can only be performed by the Root User
- Change account settings
  - Account name
  - Email address
  - Root user password
  - Root user access keys
- View certain tax invoices
- Close your AWS account
- Restore IAM user permissions
- Change or cancel your AWS Support Plan

# Reserved Instance Marketplace
- Register as a seller in the Reserved Instance Marketplace
- Configure an Amazon S3 bucket to enable MFA
- Edit or delete an Amazon S3 bucket policy that includes an invalid VPC ID or VPC Endpoint ID
- Sign up for AWS GovCloud

# IAM Access Analyzer
- Finds out which resources are shared externally

### Resources analyzed
- S3 Buckets
- IAM Roles
- KMS Keys
- Lambda Functions and Layers
- SQS Queues
- Secrets Manager Secrets

### How it works
- Defines a Zone of Trust
  - AWS Account
  - AWS Organization
- Identifies resources that can be accessed from outside the defined zone of trust
- Generates findings for resources that have external access

# Summary: Security & Compliance
- Shared Responsibility Model on AWS

- AWS Shield
  - Automatic DDoS protection
  - 24/7 support with Shield Advanced

- AWS WAF
  - Firewall to filter incoming requests based on rules

- AWS KMS
  - Encryption keys managed by AWS

- AWS CloudHSM
  - Hardware encryption
  - Customer manages the encryption keys

- AWS Certificate Manager (ACM)
  - Provision, manage and deploy SSL/TLS certificates

- AWS Artifact
  - Access compliance reports such as PCI, ISO, SOC, etc.

- Amazon GuardDuty
  - Detect malicious behavior using:
    - VPC Flow Logs
    - DNS Logs
    - CloudTrail Logs

- Amazon Inspector
  - Detect software vulnerabilities in:
    - EC2 instances
    - Amazon ECR container images
    - AWS Lambda functions

- AWS Network Firewall
  - Protect VPCs against network attacks

- AWS Config
  - Track configuration changes
  - Check compliance against AWS Config rules

- Amazon Macie
  - Discover sensitive data (for example, PII) in Amazon S3 buckets

- AWS CloudTrail
  - Track API calls made by users within an AWS account

- AWS Security Hub
  - Collect and centralize security findings from multiple AWS accounts and services

- Amazon Detective
  - Find the root cause of security issues and suspicious activities

- AWS Abuse
  - Report AWS resources used for abusive or illegal purposes

- Root User Privileges
Only the Root User can perform actions such as:
  - Change account settings
  - Close the AWS account
  - Change or cancel the AWS Support Plan
  - Register as a seller in the Reserved Instance Marketplace

- IAM Access Analyzer
  - Identify resources that are shared externally

- AWS Firewall Manager
  - Centrally manage security rules across an AWS Organization
  - Manage WAF, AWS Shield, AWS Network Firewall, and Security Groups