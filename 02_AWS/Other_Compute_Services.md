## Other Compute Services
- ECS
- Lambda
- Batch
- Lightsail

# What is Docker?
- Docker is a software platform used to deploy applications
- Applications are packaged into containers

Advantages:
- Runs consistently on any machine
- No compatibility issues
- Predictable behavior
- Less work
- Easier maintenance and deployment
- Works with any language and operating system
- Containers scale quickly

# Docker Image Storage
Docker images are stored in repositories.
Public Repository:
Docker Hub
Examples:
- Ubuntu
- MySQL
- NodeJS
- Java
Private Repository:
Amazon ECR (Elastic Container Registry)

# Docker vs Virtual Machines

Docker:
- Docker is a containerization technology (not exactly full virtualization)
- Containers share resources with the host OS

Virtual Machine Architecture:

Apps
↓
Guest OS (VM)
↓
Hypervisor
↓
Host OS
↓
Infrastructure

Docker Architecture:

Apps
↓
Containers
↓
Docker Daemon
↓
Host OS
↓
Infrastructure

Key Difference:
- VM → each VM has its own Guest OS
- Docker → containers share Host OS
- Docker uses less resources and starts faster

# Amazon ECS
ECS = Elastic Container Service
Purpose:
- Launch Docker containers on AWS
- AWS manages container lifecycle

Features:
- Must provision and maintain EC2 infrastructure
- AWS starts/stops containers
- Integrates with Application Load Balancer

# AWS Fargate
Purpose:
- Run Docker containers without managing EC2 servers

Features:
- Serverless container service
- No infrastructure provisioning
- AWS runs containers based on CPU/RAM requirements
- Simpler than ECS with EC2 management

Difference:
ECS:
- You manage EC2 servers
Fargate:
- AWS manages infrastructure

# Amazon ECR
ECR = Elastic Container Registry

Purpose:
- Private Docker image repository on AWS

Uses:
- Store Docker images
- ECS or Fargate pulls images from ECR

# Amazon EKS
EKS = Elastic Kubernetes Service

Purpose:
- Managed Kubernetes service on AWS

Kubernetes:
- Open-source system for deployment, management and scaling of containers

Containers can run on:
- EC2 instances
- Fargate (serverless)

Features:
- Cloud-agnostic
- Can run on AWS, Azure, GCP etc.

# What is Serverless?
Definition:
- Developers do not manage servers directly
- Only deploy code/functions

Important:
- Serverless does NOT mean servers do not exist
- Servers exist but AWS manages them

Examples:
- Lambda
- DynamoDB
- Amazon S3
- Fargate

Benefits:
- No provisioning
- Automatic scaling
- Less operational work

# Why Lambda?
Problems with EC2:
- Virtual servers run continuously
- Limited by CPU and RAM
- Scaling requires manual intervention

# Amazon Lambda Overview
Lambda is:
- Virtual functions with no server management
- Runs on demand
- Automatically scales

Characteristics:
- Short execution time
- Event-driven
- Pay only for execution time

Flow:

Event Trigger
      ↓
AWS Lambda Function
      ↓
Process Request
      ↓
Return Response

Examples of Triggers:
- S3 upload
- API request
- CloudWatch event
- DynamoDB changes

# Benefits of AWS Lambda
Pricing:
- Pay only per request and compute time used
- Free tier:
  - First 1,000,000 requests free
  - 400,000 GB-seconds of compute time free

Advantages:
- Integrated with AWS services
- Event-driven execution (runs only when needed)
- Supports many programming languages
- Easy monitoring through CloudWatch
- Can allocate more resources per function (up to 10 GB RAM)
- Increasing RAM also increases CPU and network performance

# AWS Lambda Language Support
Supported Languages:
- Node.js (JavaScript)
- Python
- Java
- C# (.NET Core)
- PowerShell
- Ruby

Custom Runtime:
- Runtime API allows community-supported languages
Examples:
- Rust
- Go

Container Image Support:
- Lambda supports container images
- Container image must implement Lambda Runtime API
- ECS/Fargate is preferred for arbitrary Docker containers

# Example: Serverless Thumbnail Creation

Flow:

New Image uploaded to S3
        ↓ Trigger
AWS Lambda Function
        ↓
Creates Thumbnail
        ↓
Store thumbnail in S3

Also save metadata into DynamoDB:
- Image name
- Image size
- Creation date
- Other metadata

Architecture:

S3 Upload
    ↓
Lambda Trigger
    ↓
Lambda Function
   ↙         ↘
Thumbnail S3   DynamoDB Metadata

# Example: Serverless CRON Job

Flow:

CloudWatch Events / EventBridge
            ↓ (every hour)
AWS Lambda Function
            ↓
Perform scheduled task

Examples:
- Send reports
- Clean logs
- Backup data
- Generate notifications

# AWS Lambda Pricing Example

Request Pricing:
- First 1,000,000 requests free
- After free tier:
  - $0.20 per 1 million requests

Duration Pricing:
Measured in 1 ms increments

Free:
- 400,000 GB-seconds per month

Examples:
If function uses:
1 GB RAM:
- 400,000 seconds free

128 MB RAM:
- 3,200,000 seconds free

After free tier:
- Approximately $1 per 600,000 GB-seconds

Note:
- Lambda is generally inexpensive
- Popular because of low operational and scaling costs

# Amazon API Gateway

Example: Building a Serverless API

Client
   ↓ REST API
API Gateway
   ↓ Proxy Request
AWS Lambda
   ↓ CRUD Operations
DynamoDB

Features:
- Fully managed service to create, publish, maintain, monitor and secure APIs
- Serverless and scalable
- Supports:
   - REST APIs
   - WebSocket APIs
- Security support:
   - User authentication
   - API throttling
   - API keys
   - Monitoring

# AWS Batch

Features:
- Fully managed batch processing at any scale
- Can run hundreds of thousands of computing jobs
- Batch jobs have:
   - Start point
   - End point
- Dynamically launches:
   - EC2 instances
   - Spot instances
- Automatically provisions required:
   - Compute
   - Memory
- Submit or schedule jobs and AWS handles execution
- Jobs are packaged as Docker images

Runs on:
- ECS
- EKS
- Fargate

Benefits:
- Cost optimization
- Less infrastructure management

Example Flow:

Amazon S3
    ↓ Trigger
AWS Batch
    ↓
EC2 / ECS Processing
    ↓
Amazon S3 Output

# Batch vs Lambda

Lambda:
- Time limit exists
- Limited runtimes
- Limited temporary disk space
- Serverless

Batch:
- No time limit
- Any runtime supported if packaged in Docker image
- Uses EBS / Instance Store for storage
- Relies on EC2 infrastructure

# Amazon Lightsail

Overview:
- Provides:
   - Virtual servers
   - Storage
   - Databases
   - Networking

Features:
- Low and predictable pricing
- Simpler alternative to:
   - EC2
   - RDS
   - ELB
   - EBS
   - Route53

Good for:
- Users with limited cloud experience

Monitoring:
- Notification support
- Resource monitoring

Use Cases:

1. Simple web applications
   - LAMP
   - Nginx
   - MEAN
   - Node.js

2. Websites
   - WordPress
   - Magento
   - Plesk
   - Joomla

3. Development / Testing environments
Limitations:
- High availability available
- No auto scaling
- Limited AWS integrations

# Other Compute – Summary

## Docker
- Container technology used to run applications

## ECS (Elastic Container Service)
- Runs Docker containers on EC2 instances

## Fargate
- Runs Docker containers without provisioning infrastructure
- Serverless offering (no EC2 instances to manage)

## ECR (Elastic Container Registry)
- Private repository for Docker images

## AWS Batch
- Runs batch jobs on AWS across managed EC2 instances

## Amazon Lightsail
- Low-cost and predictable pricing
- Used for simple applications and database stacks

# Lambda Summary

## Lambda Overview
- Serverless
- Function as a Service (FaaS)
- Automatic scaling
- Event-driven / reactive

## Lambda Billing
Charged based on:
- Execution time × RAM allocated
- Number of invocations (requests)

## Language Support
Supports:
- Python
- Java
- Node.js
- C#
- Ruby
- Custom Runtime API
- Docker container images

## Invocation Time
- Maximum execution time: **15 minutes**

## Common Use Cases
- Create thumbnails for images uploaded to Amazon S3
- Run serverless scheduled jobs (Cron jobs)
- Event processing
- Backend processing

## API Gateway
- Used to expose Lambda functions as HTTP APIs

# Quick Revision Notes

### ECS
- Manage EC2 instances + containers

### Fargate
- Only manage containers
- AWS manages infrastructure

### EKS
- Managed Kubernetes service

### Lambda
- Run functions without managing servers

### AWS Batch
- Used for long-running or background jobs