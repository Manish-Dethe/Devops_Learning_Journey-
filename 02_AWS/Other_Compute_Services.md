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