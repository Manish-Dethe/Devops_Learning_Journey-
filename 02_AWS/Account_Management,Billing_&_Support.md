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