# Deployments & Managing Infrastructure at Scale

# CloudFormation Overview

## What is CloudFormation?
- CloudFormation is a declarative way of defining AWS infrastructure as code.
- Supports most AWS resources.
- You define the desired infrastructure in a template and AWS creates it automatically.

### Example
Inside a CloudFormation template, you can specify:
- I want a Security Group
- I want two EC2 instances using that Security Group
- I want an Amazon S3 bucket
- I want a Load Balancer (ELB) in front of the EC2 instances

CloudFormation will:
- Create all resources automatically
- Create them in the correct order
- Apply the exact configuration specified in the template

# Benefits of AWS CloudFormation

## 1. Infrastructure as Code (IaC)
- Infrastructure is defined using code
- No manual resource creation
- Easier version control and auditing
- Changes can be reviewed through code reviews

## 2. Cost Management
- Resources in a stack can be tagged automatically
- Makes it easier to track costs per application or project
- Cost estimates can be generated from templates

### Cost Saving Example
For development environments:
- Automatically delete infrastructure at the end of the day
- Re-create infrastructure the next morning
Example:
- Delete at 5:00 PM
- Re-create at 8:00 AM
This helps reduce AWS costs.

## 3. Productivity

### Fast Environment Creation
- Destroy and recreate entire infrastructure quickly
- Useful for testing and development environments

### Automated Documentation
- CloudFormation can generate diagrams from templates

### Declarative Programming
- Describe **what** you want
- AWS determines **how** and **in what order** resources should be created

No need to manually manage:
- Resource dependencies
- Creation order
- Infrastructure orchestration

## Don't Reinvent the Wheel
- Leverage existing CloudFormation templates available online
- Use AWS documentation and sample templates
- Reuse proven architectures whenever possible

## Resource Support
- CloudFormation supports almost all AWS resources
- Most AWS services can be deployed using CloudFormation
- For unsupported resources, use **Custom Resources**

### CloudFormation
- Infrastructure as Code (IaC)
- Uses templates
- Declarative approach
- Automates resource provisioning
- Supports version control
- Helps with cost management
- Improves productivity and consistency

# CloudFormation + Infrastructure Composer

## Overview
Example: WordPress CloudFormation Stack
Benefits:
- Visualize all resources in a stack
- View relationships between components
- Understand architecture more easily

# AWS Cloud Development Kit (CDK)

## Overview
AWS CDK allows you to define cloud infrastructure using familiar programming languages.
Supported Languages:
- TypeScript
- JavaScript
- Python
- Java
- .NET

## How CDK Works
- Infrastructure is written in code
- CDK converts ("synthesizes") the code into CloudFormation templates
- Generated templates are deployed by CloudFormation

Output Formats:
- JSON
- YAML

## Benefits
- Infrastructure and application code can be deployed together
- Excellent for Lambda functions
- Excellent for Docker workloads running on ECS or EKS
- Easier for developers compared to writing raw CloudFormation

# Typical 3-Tier Web Application Architecture

User
↓
Elastic Load Balancer (Multi-AZ)
↓
Auto Scaling Group (EC2 Instances across multiple AZs)
↓
Application Layer

Connected Services:

- Amazon RDS
  - Read/Write database operations
- ElastiCache
  - Session storage
  - Cached application data
Benefits:
- High Availability
- Scalability
- Fault Tolerance
- Performance Optimization

# Developer Problems on AWS
Developers typically need to manage:
- Infrastructure
- Application deployment
- Database configuration
- Load balancers
- Scaling
- Monitoring

Most applications share similar architecture patterns:
- Load Balancer
- Auto Scaling Group
- Database Layer

Developers primarily want to focus on writing code.

# AWS Elastic Beanstalk

## Overview
Elastic Beanstalk provides a developer-focused way to deploy applications on AWS.

### Characteristics
- Platform as a Service (PaaS)
- Uses AWS services underneath:
  - EC2
  - Auto Scaling Groups
  - Elastic Load Balancers
  - RDS
  - Other AWS services

### Benefits
- Simplifies deployment
- Provides a single management view
- Developers maintain application code
- AWS manages infrastructure configuration

### Pricing
- Elastic Beanstalk itself is free
- Pay only for underlying AWS resources

# Elastic Beanstalk Features

Beanstalk manages:
- Instance configuration
- Operating system configuration
- Deployment strategies
- Capacity provisioning
- Load balancing
- Auto Scaling
- Application health monitoring

## Architecture Models

### Single Instance
- Best for development environments

### Load Balancer + Auto Scaling Group
- Best for production environments

### ASG Only
- Suitable for worker applications and background processing

# Supported Platforms
- Go
- Java SE
- Java with Tomcat
- .NET on Windows Server with IIS
- Node.js
- PHP
- Python
- Ruby
- Docker (Single Container)
- Docker (Multi-Container)
- Preconfigured Docker

# Elastic Beanstalk Health Monitoring
- Health agent sends metrics to CloudWatch
- Monitors application health
- Publishes health events
- Tracks responsiveness and availability

# AWS CodeDeploy

## Overview
Used to automate application deployments.

### Supports
- Amazon EC2 instances
- On-premises servers
- Hybrid environments

### Requirements
Servers must already:
- Exist
- Be configured
- Have the CodeDeploy Agent installed

### Benefits
- Automated deployments
- Reduced manual effort
- Consistent deployment process

# AWS CodeCommit

## Overview
Before deployment, source code must be stored in a repository.
CodeCommit is AWS's Git-based repository service.

### Features
- Source control using Git
- Hosted Git repositories
- Team collaboration
- Automatic versioning of code changes

### Benefits
- Fully managed
- Highly available
- Scalable
- Private and secure
- Integrated with AWS services

### Comparison
- GitHub → Popular public Git hosting service
- CodeCommit → AWS-managed Git repository service

# AWS CodeBuild

## Overview
AWS CodeBuild is a cloud-based build service.
It:
- Compiles source code
- Runs tests
- Produces deployment-ready artifacts

### Workflow
CodeCommit → CodeBuild → Deployment Artifact → CodeDeploy

## Benefits
- Fully managed
- Serverless
- Continuously scalable
- Highly available
- Secure
- Pay-as-you-go pricing (pay only for build time)

# AWS CodePipeline
## Overview
AWS CodePipeline automates and orchestrates the software release process.
Typical Pipeline:
Code → Build → Test → Provision → Deploy
It forms the basis of:
- Continuous Integration (CI)
- Continuous Delivery (CD)

## Benefits
- Fully managed
- Integrates with:
  - CodeCommit
  - CodeBuild
  - CodeDeploy
  - Elastic Beanstalk
  - CloudFormation
  - GitHub
  - Third-party services
  - Custom plugins
- Faster software delivery
- Rapid updates

## Example Flow
CodeCommit
↓
CodeBuild
↓
CodeDeploy
↓
Elastic Beanstalk

(CodePipeline acts as the orchestration layer)

# AWS CodeArtifact

## Overview
Applications depend on software packages called dependencies.
Examples:
- Maven packages
- npm packages
- Python packages
- NuGet packages
Managing and storing these dependencies is called **Artifact Management**.
AWS CodeArtifact provides a managed artifact repository.

## Features
- Secure
- Scalable
- Cost-effective
- Fully managed

## Supported Package Managers
- Maven
- Gradle
- npm
- Yarn
- Twine
- pip
- NuGet

## Benefits
- Developers retrieve dependencies directly from CodeArtifact
- CodeBuild can pull dependencies automatically
- Eliminates the need to manage your own artifact repository

# AWS Systems Manager (SSM)

## Overview
AWS Systems Manager helps manage AWS and on-premises infrastructure at scale.
Supports:
- Amazon EC2
- On-premises servers
- Hybrid environments

## Benefits
- Centralized operational management
- Infrastructure visibility
- Automation capabilities
- Works across large server fleets

## Important Features

### Patch Manager
- Automates operating system patching
- Helps maintain security and compliance

### Run Command
- Execute commands across many servers simultaneously
- No need to log in to each server individually

### Parameter Store
- Store configuration values
- Store application parameters
- Store secrets securely
Examples:
- Database URLs
- API endpoints
- Application settings
- Credentials

## Supported Operating Systems
- Linux
- Windows
- macOS
- Raspberry Pi OS (Raspbian)