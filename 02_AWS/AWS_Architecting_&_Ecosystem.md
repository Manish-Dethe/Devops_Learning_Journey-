# AWS Architecting & Ecosystem

## AWS Whitepapers - Well-Architected Framework
- Stop guessing your capacity needs
- Test systems at production scale
- Automate to make architectural experimentation easier
- Allow for evolutionary architectures
  - Design based on changing requirements
- Drive architecture using data
- Improve through game days
  - Simulate applications for flash sale days

# AWS Cloud Best Practices - Design Principles

- **Scalability**
  - Vertical scaling
  - Horizontal scaling

- **Disposable Resources**
  - Servers should be disposable and easily configured

- **Automation**
  - Serverless
  - Infrastructure as a Service (IaaS)
  - Auto Scaling

- **Loose Coupling**
  - Monolithic applications become larger over time
  - Break them down into smaller, loosely coupled components
  - A change or failure in one component should not cascade to other components

- **Services, Not Servers**
  - Don't use just EC2
  - Use managed services, databases, serverless services, etc.

# Well-Architected Framework - 6 Pillars

1. Operational Excellence
2. Security
3. Reliability
4. Performance Efficiency
5. Cost Optimization
6. Sustainability

- These are not something to balance or trade off; they work together as a synergy.

# 1. Operational Excellence
- Includes the ability to run and monitor systems to deliver business value and continually improve supporting processes and procedures.

## Design Principles
- Perform operations as code
  - Infrastructure as Code (IaC)
- Make frequent, small, reversible changes
  - If a failure occurs, you can easily roll back
- Refine operational procedures frequently
  - Ensure team members are familiar with them
- Anticipate failure
- Learn from all operational failures
- Use managed services
  - Reduce operational burden
- Implement observability for actionable insights
  - Performance
  - Reliability
  - Cost

## Operational Excellence AWS Services

### Prepare
- AWS CloudFormation
- AWS Config

### Operate
- AWS CloudFormation
- AWS Config
- AWS CloudTrail
- Amazon CloudWatch
- AWS X-Ray

### Evolve
- AWS CloudFormation
- AWS CodeBuild
- AWS CodeCommit
- AWS CodeDeploy
- AWS CodePipeline

# 2. Security
- Includes the ability to protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies.

## Design Principles
- Implement a strong identity foundation
  - Centralize privilege management
  - Reduce or eliminate long-term credentials
  - Follow the Principle of Least Privilege (IAM)
- Enable traceability
  - Integrate logs and metrics with systems to automatically respond and take action
- Apply security at all layers
  - Edge network
  - VPC
  - Subnets
  - Load Balancers
  - EC2 instances
  - Operating systems
  - Applications
- Automate security best practices
- Protect data in transit and at rest
  - Encryption
  - Tokenization
  - Access control
- Keep people away from data
  - Reduce or eliminate direct access and manual data processing
- Prepare for security events
  - Run incident response simulations
  - Use automation to improve detection, investigation, and recovery

## Security AWS Services

### Identity & Access Management
- IAM
- AWS STS
- MFA Tokens
- AWS Organizations

### Detective Controls
- AWS Config
- AWS CloudTrail
- Amazon CloudWatch

### Infrastructure Protection
- Amazon CloudFront
- Amazon VPC
- AWS Shield
- AWS WAF
- Amazon Inspector

### Data Protection
- AWS KMS
- Amazon S3
- Elastic Load Balancing (ELB)
- Amazon EBS
- Amazon RDS

### Incident Response
- IAM
- AWS CloudFormation
- Amazon CloudWatch Events