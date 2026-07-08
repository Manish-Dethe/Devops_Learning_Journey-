# Account Management, Billing & Support

# AWS Organizations Overview
- Global service
- Allows you to manage multiple AWS accounts
- The main account is the **Master Account**

## Cost Benefits
- Consolidated billing across all accounts (single payment method)
- Pricing benefits from aggregated usage (volume discounts for services like EC2, S3, etc.)
- Pooling of Reserved EC2 Instances for optimal savings

## Features
- API available to automate AWS account creation
- Restrict account privileges using **Service Control Policies (SCPs)**

# Multi-Account Strategies
- Create separate AWS accounts:
  - Per department
  - Per cost center
  - Per environment (Dev / Test / Prod)
- Use **Service Control Policies (SCPs)** based on regulatory restrictions
- Better resource isolation (e.g., separate VPCs per account)
- Separate service limits for each account
- Dedicated account for centralized logging
- Compare:
  - Multi-Account architecture
  - Single Account with Multiple VPCs
- Use resource tagging standards for billing purposes
- Enable **CloudTrail** on all accounts and send logs to a central S3 logging account
- Send **CloudWatch Logs** to a centralized logging account

# AWS Organizations Structure
```text
Root OU (Organization Unit)
│
└── Master Account
    │
    ├── Dev OU
    │   ├── Account 1
    │   └── Account 2
    │
    └── Prod OU
        ├── Finance OU
        └── HR OU
```

# Service Control Policies (SCP)
- Works as a whitelist or blacklist for IAM actions
- Applied at the Organizational Unit (OU) or Account level
- Does **not** directly grant permissions
- Applied to all users and roles in the account, including the **Root User**
- SCPs do **not** affect service-linked roles
- Service-linked roles remain enabled even if AWS services are integrated with AWS Organizations
- SCPs cannot restrict the **Management (Master) Account**
- By default, an SCP must explicitly allow actions (`Allow` policy)

## Use Cases
- Restrict access to certain AWS services
- Enforce PCI compliance
- Restrict the use of specific AWS Regions

# AWS Organizations – Consolidated Billing
- Enabled automatically when using AWS Organizations
- Combines usage from all AWS accounts in the organization

## Benefits
- Combined usage provides higher volume discounts
- Reserved Instance and Savings Plan discounts are shared across eligible accounts
- One consolidated bill for all AWS accounts
- The Management (Master) Account receives a single bill, including charges from all member accounts
- Reserved Instance discounts can be shared among AWS accounts within the organization

# AWS Control Tower
- Easy way to set up and govern a secure and compliant multi-account AWS environment based on best practices

## Benefits
- Automate the setup of your environment in a few clicks
- Automate ongoing policy management using guardrails
- Detect policy violations and remediate them
- Monitor compliance through an interactive dashboard
- AWS Control Tower runs on top of AWS Organizations
- Automatically sets up AWS Organizations to organize accounts and implement SCPs (Service Control Policies)

# AWS Resource Access Manager (AWS RAM)
- Share AWS resources that you own with other AWS accounts
- Share with any account or within your organization
- Avoid resource duplication
- Supported resources include:
  - Aurora
  - VPC Subnets
  - Transit Gateway
  - Route 53
  - EC2 Dedicated Hosts
  - License Manager configurations

# AWS Service Catalog
- Users that are new to AWS have too many options and may create stacks that are not compliant (in line with the rest of the organization)
- Some users just want a quick self-service portal to launch a set of authorized products predefined by admins
- Includes:
  - Virtual machines
  - Databases
  - Storage options
  - etc.
- Enter AWS Service Catalog

### Admin Tasks
- Product (CloudFormation Templates)
- Portfolio (Collection of Products)
- Controls
- IAM permissions to access portfolios

### User Tasks
- Product List
- Provisioned Products:
  - Ready to use
  - Properly configured
  - Properly tagged

# Pricing Models in AWS
AWS has **4 pricing models**:

- Pay as you go:
  - Pay for what you use
  - Remain agile
  - Responsive
  - Meet scale demand

- Save when you reserve:
  - Minimize risks
  - Predictably manage budgets
  - Comply with long-term requirements

- Reservations are available for:
  - EC2 Reserved Instances
  - DynamoDB Reserved Capacity
  - ElastiCache Reserved Nodes
  - RDS Reserved Instances
  - Redshift Reserved Nodes

- Pay less by using more:
  - Volume-based discounts

- Pay less as AWS grows


# Savings Plan
- Commit a certain dollar amount per hour for **1 or 3 years**
- Easiest way to setup long-term commitments on AWS

## EC2 Savings Plan
- Up to **72% discount** compared to On-Demand
- Commit to usage of individual instance families in a Region (e.g. C5 or M5)
- Regardless of:
  - Availability Zone (AZ)
  - Size (M5.xl to M5.4xl)
  - OS (Linux / Windows)
  - Tenancy
- All Upfront
- Partial Upfront
- No Upfront

## Compute Savings Plan
- Up to **66% discount** compared to On-Demand
- Regardless of:
  - Family
  - Region
  - Size
  - OS
  - Tenancy
  - Compute options
- Compute options:
  - EC2
  - Fargate
  - Lambda

## Machine Learning Savings Plan
- SageMaker
- Setup from the AWS Cost Explorer console
- Estimate

# AWS Compute Optimizer
- Reduce cost and improve performance by recommending optimal AWS resources for your workloads
- Helps you choose optimal configurations and right size your workloads (over/under provisioned)
- Uses Machine Learning to analyze your resources configuration and their utilizations CloudWatch metrics

## Supported Resources
- EC2 instances
- EC2 Auto Scaling Groups
- EBS Volumes
- Lambda functions
- Lower your cost by up to 25%
- Recommendations can be exported to S3

# Billing and Costing Tools

## Estimating costs in the cloud
- Pricing Calculator

## Tracking costs in the cloud
- Billing Dashboard
- Cost Allocation Tags
- Cost and Usage Reports
- Cost Explorer

## Monitoring against cost plans
- Billing Alarms
- Budgets

# Cost Allocation Tags
- Use cost allocation Tags to track your AWS costs on a detailed level

## AWS generated tags
- Automatically applied to the resource you create
- Starts with Prefix `aws:`

## User defined tags
- Defined by the user
- Starts with Prefix `user:`

# Tagging and Resource Groups
- Tags are used for organizing resources
- EC2:
  - Instances
  - Images
  - Load Balancers
  - Security Groups
- RDS, VPC resources, Route 53, IAM Users, etc.
- Resources created by CloudFormation are all tagged the same way
- Free naming, common tags are:
  - Name
  - Environment
  - Team
- Tags can be used to create Resource Groups
  - Create, maintain, and view a collection of resources that share common tags
  - Manage these tags using the Tag Editor

# Cost and Usage Reports
- The AWS Cost & Usage Report contains the most comprehensive set of AWS cost and usage data available, including additional metadata about AWS services, pricing, and reservations (e.g. Amazon EC2 Reserved Instances (RIs))
- The AWS Cost & Usage Report lists AWS usage for each service category used by an account and its IAM users in hourly or daily line items, as well as any tags that you have activated for cost allocation purposes
- Can be integrated with:
  - Athena
  - Redshift
  - QuickSight

# Cost Explorer
- Visualize, understand and manage your AWS costs and usage over time
- Create custom reports that analyze cost & usage data
- Analyze your data at a high level:
  - Total costs and usage across all accounts
  - Monthly
  - Hourly
  - Resource level granularity
- Choose an optimal Savings Plan (to lower prices on your bill)
- Forecast usage up to 12 months based on previous page

# Monitoring Alarms in the Cloud - Billing Alarm & AWS Budgets

## Billing Alarm in CloudWatch
- Billing data metrics is stored in CloudWatch us-east-1
- Billing data are for overall worldwide AWS costs
- It's for actual cost, not for projected costs
- Intended as a simple alarm (not as powerful as AWS Budgets)

# AWS Budgets
- Create budget and send alarms when costs exceeds the budget
- 4 types of budgets:
  - Usage
  - Cost
  - Reservation
  - Savings Plan

## For Reserved Instances (RI)
- Track utilization
- Supports:
  - EC2
  - ElastiCache
  - RDS
  - RedShift
- Up to 5 SNS notifications per budget
- Can filter by:
  - Service
  - Linked Account
  - Tag
  - Purchase option
  - Instance Type
  - Region
  - Availability Zone
  - API operation
  - etc...
- Same options as AWS Cost Explorer

# AWS Cost Anomaly Detection
- Continuously monitor your cost and usage, using ML to detect unusual spends
- It learns your unique, historic spend patterns to detect one time cost spike and/or continuous cost increases (you don't need to define thresholds)
- Monitor AWS services, member accounts, cost allocation tags or cost categories
- Sends you the anomaly detection report with root cause analysis
- Get notified with individual alerts or daily/weekly summary (using SNS)

# AWS Service Quotas
- Notify you when you're close to a service quota value threshold
- Create CloudWatch Alarms on the Service Quotas console
- Example:
  - Lambda concurrent executions
- Request a quota increase from AWS Service Quotas or shutdown resources before limit is reached

# Trusted Advisor
- No need to install anything - high level AWS account assessment
- Analyze your AWS accounts and provides recommendation on 6 categories:
  - Cost optimization
  - Performance
  - Security
  - Fault tolerance
  - Service limits
  - Operational Excellence
- Business & Enterprise Support Plan
  - Full set of checks
  - Programmatic Access using AWS Support API

# Support Plans for AWS

## AWS Basic Support Plan
- Customer Service & Communities
  - 24 x 7 access to customer service, documentation, whitepapers, and support forums
- AWS Trusted Advisor
  - Access to the 7 core Trusted Advisor checks and guidance to provision your resources following best practices to increase performance and improve security.
- AWS Personal Health Dashboard
  - A personalized view of the health of AWS services, and alerts when your resources are impacted

## AWS Business Support+ Plan (24/7)
- Intended to be used if you have production workloads
- Real time and contextual responses through Gen AI
- Trusted Advisor
  - Full set of checks + API access
- 24 x 7 phone, web, and chat access to Cloud Support Engineers
- Unlimited cases / unlimited contacts
- Max 30 minutes of waiting before getting a human support response for business-critical system down cases
- 3rd party software support (Ex: EC2 OS like Ubuntu)

## AWS Enterprise Support Plan (24/7)
- Intended to be used if you have production or business critical workloads
- All of Business Support+ Plan
- Access to designated Technical Account Manager (TAM)
- Less than 15 minute production critical case response
- Access to AWS Security Incident Response (helps you recover from security incidents)
- Business reviews from AWS experts
- Access to AWS Countdown event management

## AWS Unified Operations Support Plan (24/7)
- Intended to be used if you have mission critical workloads
- All of Business Support Plan +
- Application Architecture Guidance
  - Helps you design architectures that fit your use case, workloads
- Short term engagement with AWS support for deep understanding, analysis then provide architectural guidance
- Access to a designated
  - Technical Account Manager (TAM), Domain Specialist Engineer (DSE)
  - Senior Billing and Account Specialist (SBAS), Incident Management Engineer (IME)
  - Migration Specialist (On demand), Specialist Support Engineer (SSE)
- Access to AWS Countdown Premium and AWS Customer Incident Response Team (CIRT)
- Critical workloads review, operational procedures...

# Account Best Practices - Summary
- Operate multiple accounts using Organizations
- Use SCP to restrict account power
- Easily setup multiple accounts with best practices with AWS Control Tower
- Use Tags & Cost allocation tags for easy management & billing
- IAM guidelines:
  - MFA
  - Least privilege
  - Password policy
  - Password rotation
- Config to record all resources configurations & compliance over time
- CloudFormation to deploy stacks across account and regions
- Trusted Advisor to get insights, support plan adapted to your needs
- Send service logs and Access Logs to S3 or CloudWatch Logs
- CloudTrail to record API calls made within your account
- If your Account is compromised:
  - Change the root password
  - Delete and rotate all passwords/keys
  - Contact AWS Support
- Allow users to create pre defined stacks defined by admins using AWS Service Catalog

# Billing and Costing Tools Summary
- Compute Optimizer
  - Recommends resources configuration to reduce costs
- Pricing Calculator
  - Cost of services on AWS
- Billing Dashboards
  - High level overview
- Cost Allocation Tags
  - Tag resources to create detailed reports
- Cost and Usage Reports
  - Most comprehensive billing dataset
- Cost Explorer
  - View current usage (detailed) & forecast usage
- Billing Alarms
  - In us-east-1 track overall & per service billing
- Budgets
  - More advanced
  - Track usage, costs, RI & get alerts
- Saving Plans
  - Easy way to save based on long term usage of AWS
- Cost Anomaly Detection
  - Detect unusual spends using ML
- Service Quotas
  - Notify you when you're close to service quota threshold