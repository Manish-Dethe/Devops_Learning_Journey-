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