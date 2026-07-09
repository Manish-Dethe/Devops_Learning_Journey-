# Advanced Identity

## Security Token Service (STS) Overview
- Enables you to create temporary, limited privileges credentials to access your AWS resources
- Short term credentials
  - You configure expiration period
- Use cases
  - Identity federation: manage user identities in external systems, and provide them STS tokens to access AWS resources
  - IAM Roles for cross/same account access
  - IAM Roles for Amazon EC2: provide temporary credentials for EC2 instances to access AWS resources

# Amazon Cognito
- Identity for your Web and Mobile application users (potentially millions)
- Instead of creating them as IAM users, you can create a user in Cognito

# What is Microsoft Active Directory (AD)?
- Found on any Windows Server with AD Domain Services
- Database of objects:
  - User Accounts
  - Computers
  - Printers
  - File shares
  - Security Groups
- Centralized security management, create account assign permissions

# AWS Directory Services

## AWS Managed Microsoft AD
- Create your own AD in AWS, manage users locally, support MFA
- Establish "trust" connections with your on-premise AD

## AD Connector
- Directory Gateway (proxy) to redirect to on-premise AD, supports MFA
- Users are managed on the on-premise AD

## Simple AD
- AD-compatible managed directory on AWS
- Cannot be joined with on-premise AD

# AWS IAM Identity Center
*(Successor to IAM Single Sign-On)*

- One login (Single Sign-On) for all your
  - AWS accounts in AWS Organizations
  - Business cloud applications (e.g. Salesforce, Box, Microsoft 365, ...)
  - SAML 2.0-enabled applications
  - EC2 Windows Instances

### Identity providers
- Built-in identity store in IAM Identity Center
- 3rd party:
  - Active Directory (AD)
  - OneLogin
  - Okta

# Advanced Identity Summary
- IAM
  - Identity and Access Management inside your AWS account
  - For users that you trust and belong to your company
- Organizations
  - Manage multiple accounts
- Security Token Service (STS)
  - Temporary, limited-privileges credentials to access AWS resources
- Cognito
  - Create a database of users for your mobile & web applications
- Directory Services
  - Integrate Microsoft Active Directory in AWS
- IAM Identity Center
  - One login for multiple AWS accounts & applications