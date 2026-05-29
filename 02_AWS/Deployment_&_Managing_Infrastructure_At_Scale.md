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

# Quick Revision

### CloudFormation
- Infrastructure as Code (IaC)
- Uses templates
- Declarative approach
- Automates resource provisioning
- Supports version control
- Helps with cost management
- Improves productivity and consistency

### Interview One-Liner

**CloudFormation is an AWS Infrastructure as Code service that allows you to define and provision AWS resources using declarative templates.**