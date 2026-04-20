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