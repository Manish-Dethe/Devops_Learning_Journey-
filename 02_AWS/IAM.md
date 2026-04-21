# IAM: Users & Group
- IAM = Identity and Access Management (Global Service)
- Root account is created by default and should not be used or shared  
- Users are people within your organization and they can be grouped  
- Groups:Contain users (not other groups)  
- Users don’t have to belong to a group, a user can belong to multiple groups  

# IAM: Permissions
- Users or groups are assigned JSON documents called **policies**  
- Policies define permissions of a user  
- AWS follows **Least Privilege Principle** : Don’t give more permissions than required  

# IAM Policies & Group Structure

## IAM Policies
- Policies are JSON documents  
- Define permissions of users  

## Policy Inheritance Concept
- Users can belong to groups  
- Groups have policies attached  
- Users inherit permissions from groups  
  
# IAM Policy Structure

## A Policy Consists Of

- **Version**  
  - Policy language version  
  - Always include: `"2012-10-17"`

- **Id**  
  - Identifier for the policy (optional)

- **Statement**  
  - One or more individual statements (required)

## Statement Components

- **Sid**  
  - Identifier for the statement (optional)

- **Effect**  
  - Defines access:
    - Allow  
    - Deny  

- **Principal**  
  - Account / user / role to which policy applies  

- **Action**  
  - List of actions allowed or denied  

- **Resource**  
  - Resources on which actions apply  

- **Condition**  
  - When the policy is in effect (optional)  

# IAM Password Policy
- Strong passwords = higher security  

## AWS Password Policy Features
- Set minimum password length  
- Require specific character types:
  - Uppercase  
  - Lowercase  
  - Numbers  
  - Non-alphanumeric characters  

- Allow IAM users to change their own passwords  
- Force password reset after certain time (expiration)  
- Prevent password reuse  

# Multi-Factor Authentication (MFA)
- Users can access account and modify/delete resources  
- Protect:
  - Root account  
  - IAM users  
- MFA =  
  Something you know (password)  
  +  
  Something you have (security device)  

# MFA (Multi-Factor Authentication)

## Main Benefit of MFA
- If a password is stolen or hacked, the account is still protected  
- Adds an extra layer of security  

## MFA Device Options in AWS

### 1. Virtual MFA Device
- Example:
  - Google Authenticator  
  - Authy (phone only)  
- Supports multiple tokens on a single device  

### 2. U2F Security Key (Universal 2nd Factor)
- Example:
  - YubiKey (3rd party)  
- Supports multiple root and IAM users using a single security key  

# AWS Access: Keys, CLI and SDK

## How Can Users Access AWS?
You have three options:

1. **AWS Management Console**
   - Protected by password + MFA  

2. **AWS CLI (Command Line Interface)**
   - Protected by access keys  

3. **AWS SDK**
   - Used in code  
   - Protected by access keys  

## Access Keys
- Generated via AWS Console  
- Managed by IAM users  

### Important
- Access keys are **secret** (like passwords)  
- Do NOT share them  

## Components
- **Access Key ID** → like username  
- **Secret Access Key** → like password  

# What is AWS CLI?
- Tool to interact with AWS services via command line  
- Uses public AWS APIs  
- Can automate tasks using scripts  
- Open source (available on GitHub)  
- Alternative to AWS Management Console  

# What is AWS SDK?
- AWS Software Development Kit (SDK)  
- Language-specific APIs (set of libraries)  
- Enables access and management of AWS services programmatically  
- Embedded within your application  

## Supported SDK Languages
- SDks(JavaScript, Python, PHP, .NET, Ruby, Java, Go, Node.js, C++)  
- Mobile SDKs (Android, iOS)  
- IoT SDKs (Embedded devices like Arduino)  

## AWS CLI
- Built using AWS SDK (Python – boto3)

# IAM Roles for Services
- Some AWS services need permissions to perform actions  

## IAM Roles
- Assign permissions to AWS services  
- Example:
  - EC2 Instance Roles  
  - Lambda Roles  
  - Roles for CloudFormation  

# IAM Security Tools

## 1. IAM Credentials Report (Account Level)

- A report that lists **all users in your AWS account**  
- Shows the **status of their credentials**

## 2. IAM Access Advisor (User Level)

- Shows **service permissions granted to a user**  
- When those services were last accessed
 
# IAM Guidelines & Best Practices
- Don’t use the root account except for AWS account setup  
- One physical user = one IAM user  
- Assign users to groups and assign permissions to groups  
- Create a strong password policy  
- Enable and enforce MFA (Multi-Factor Authentication)  
- Create and use roles for giving permissions to AWS services  
- Use access keys for programmatic access (CLI / SDK)  
- Audit permissions using IAM credentials report & IAM access advisor  
- Never share IAM users or access keys  

# Shared Responsibility Model (IAM Perspective)

## What AWS is Responsible For (Security OF the Cloud)
- Infrastructure (global network security)  
- Configuration and vulnerability analysis  
- Compliance validation  

## What You (Customer) Are Responsible For (Security IN the Cloud)
- Users, Groups, Roles, Policies management  
- Enable MFA on all accounts  
- Rotate access keys regularly  
- Use IAM tools to apply appropriate permissions  
- Analyze access patterns and review permissions  

# IAM Summary
- Users → mapped to a physical user, has password for AWS console  
- Groups → contain users only  
- Policies → JSON documents that define permissions  
- Roles → used by AWS services (EC2, Lambda, etc.)  
- Security -> MFA + strong password policy
- AWS CLI → manage services using command line  
- AWS SDK → manage services using programming languages  
- Access Keys -> Used for CLI & SDK ,Must be kept secret  
- Audit & Monitoring -> IAM credential report, IAM access advisor (last accessed services)  