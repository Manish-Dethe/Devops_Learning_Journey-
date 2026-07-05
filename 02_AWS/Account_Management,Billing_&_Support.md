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