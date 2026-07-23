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

# 3. Reliability
- Ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand, and mitigate disruptions such as misconfigurations or transient network issues.

## Design Principles
- Test recovery procedures
  - Use automation to simulate failures or recreate failure scenarios.
- Automatically recover from failure
  - Anticipate and remediate failures before they occur.
- Scale horizontally
  - Increase aggregate system availability by distributing requests across multiple smaller resources to avoid a single point of failure.
- Stop guessing capacity
  - Maintain the optimal level of resources to satisfy demand without over or under provisioning.
  - Use Auto Scaling.
- Manage change through automation
  - Use automation to make infrastructure changes.

## Reliability AWS Services

### Foundations
- IAM
- Amazon VPC
- Service Limits
- AWS Trusted Advisor

### Change Management
- AWS Auto Scaling
- Amazon CloudWatch
- AWS CloudTrail
- AWS Config

### Failure Management
- AWS CloudFormation
- Amazon S3
- Amazon S3 Glacier
- Amazon Route 53

# 4. Performance Efficiency
- Includes the ability to use computing resources efficiently to meet system requirements and maintain efficiency as demand changes and technologies evolve.

## Design Principles
- Democratize advanced technologies
  - Advanced technologies become managed services so you can focus more on product development
- Go global in minutes
  - Easily deploy applications across multiple AWS Regions.
- Use serverless architectures
  - Avoid the burden of managing servers.
- Experiment more often
  - Easily perform comparative testing.
- Mechanical sympathy
  - Be aware of and choose the AWS services that best fit your workload.

## Performance Efficiency AWS Services

### Selection
- AWS Auto Scaling
- AWS Lambda
- Amazon Elastic Block Store (EBS)
- Amazon Simple Storage Service (S3)
- Amazon RDS

### Review
- AWS CloudFormation
- AWS News Blog

### Monitoring
- Amazon CloudWatch
- AWS Lambda

### Trade-offs
- Amazon RDS
- Amazon ElastiCache
- AWS Snowball
- Amazon CloudFront

# 5. Cost Optimization
- Includes the ability to run systems to deliver business value at the lowest price point.

## Design Principles
- Adopt a consumption model
  - Pay only for what you use.
- Measure overall efficiency
  - Use Amazon CloudWatch.
- Stop spending money on data center operations
  - AWS manages the infrastructure, allowing customers to focus on business projects.
- Analyze and attribute expenditure
  - Accurately identify system usage and costs.
  - Measure Return on Investment (ROI).
  - Use resource tags for cost allocation.
- Use managed and application-level services
  - Reduce total cost of ownership.
  - Managed services operate at cloud scale and offer a lower cost per transaction or service.

## Cost Optimization AWS Services

### Expenditure Awareness
- AWS Budgets
- AWS Cost and Usage Report
- AWS Cost Explorer
- Reserved Instance Reporting

### Cost-Effective Resources
- Spot Instances
- Reserved Instances
- Amazon S3 Glacier

### Matching Supply and Demand
- AWS Auto Scaling
- AWS Lambda

### Optimizing Over Time
- AWS Trusted Advisor
- AWS Cost and Usage Report

# 6. Sustainability
- The Sustainability pillar focuses on minimizing the environmental impact of running cloud workloads.

## Design Principles
- Understand your impact
  - Establish performance indicators and evaluate improvements.
- Establish sustainability goals
  - Set long-term goals for each workload.
  - Measure Return on Investment (ROI).
- Maximize utilization
  - Right-size workloads to maximize resource efficiency.
- Anticipate and adopt new, more efficient hardware and software
  - Design for flexibility to adopt new technologies.
- Use managed services
  - Managed services automate sustainability best practices.
  - Move infrequently accessed data to cold storage.
  - Adjust compute capacity automatically.
- Reduce the downstream impact of cloud workloads
  - Reduce the energy and resources required by your services.
  - Upgrade services when beneficial.

## Sustainability AWS Services
- EC2 Auto Scaling
- AWS Lambda
- AWS Fargate
- AWS Cost Explorer
- AWS Graviton2
- EC2 Spot Instances
- Amazon EFS-IA
- Amazon S3 Glacier
- EBS Cold HDD Volumes
- S3 Intelligent-Tiering
- Amazon Data Lifecycle Manager
- Amazon RDS Read Replicas
- Amazon Aurora Global Database
- Amazon DynamoDB Global Tables
- Amazon CloudFront

# AWS Well-Architected Tool
- Free tool to review your architectures against the 6 pillars of the Well-Architected Framework and adopt architectural best practices.

## How does it work?
- Select your workload and answer questions.
- Review your answers against the 6 pillars.
- Obtain advice:
  - Get videos and documentation.
  - Generate a report.
  - View results in a dashboard.

# AWS Customer Carbon Footprint Tool
- Track, measure, review, and forecast the carbon emissions generated from your AWS usage.
- Helps you meet your sustainability goals.

# AWS Cloud Adoption Framework (AWS CAF)
- Helps you build and execute a comprehensive plan for digital transformation using AWS.
- Created by AWS professionals using AWS best practices and lessons learned from thousands of customers.
- AWS CAF identifies specific organizational capabilities required for successful cloud transformations.
- AWS CAF groups capabilities into six perspectives:
  - Business
  - People
  - Governance
  - Platform
  - Security
  - Operations

# CAF Perspectives and Foundational Capabilities

## Business Capabilities

### Business Perspective
- Ensures cloud investments accelerate digital transformation goals and business outcomes.

### People Perspective
- Acts as a bridge between technology and business.
- Accelerates the cloud journey.
- Helps organizations evolve toward a culture of:
  - Continuous growth
  - Learning
  - Business-as-normal change
- Focuses on:
  - Culture
  - Organizational structure
  - Leadership
  - Workforce

### Governance Perspective
- Helps orchestrate cloud initiatives.
- Maximizes organizational benefits.
- Minimizes transformation-related risks.

## Technical Capabilities

### Platform Perspective
- Build an enterprise-grade, scalable hybrid cloud platform.
- Modernize existing workloads.
- Implement new cloud-native solutions.

### Security Perspective
- Helps achieve:
  - Confidentiality
  - Integrity
  - Availability
- Protects cloud workloads and data.

### Operations Perspective
- Ensures cloud services are delivered at a level that meets business requirements.

# Cloud Transformation Value Chain

## Transformation Domains
- Technology
- Process
- Organization
- Product

## Foundational Capabilities
- Business
- People
- Governance
- Platform
- Security
- Operations

## Business Outcomes
- Reduce business risk
- Improve ESG
- Grow revenue
- Increase operational efficiency

# AWS CAF – Transformation Domains

## Technology
- Use the cloud to migrate and modernize:
  - Legacy infrastructure
  - Applications
  - Data and analytics platforms

## Process
- Digitize, automate, and optimize business operations.
- Leverage new data and analytics platforms to create actionable insights.
- Use Machine Learning (ML) to improve customer service experience.

## Organization
- Reimagine your operating model.
- Organize teams around products and value streams.
- Use Agile methods to rapidly iterate and evolve.

## Product
- Reimagine your business model.
- Create new value propositions (products and services).
- Develop new revenue models.

# AWS CAF – Transformation Phases

## Envision
- Demonstrate how cloud adoption accelerates business outcomes.
- Identify transformation opportunities.
- Build a foundation for digital transformation.

## Align
- Identify capability gaps across the six AWS CAF perspectives.
- Create an action plan.

## Launch
- Build and deliver pilot initiatives in production.
- Demonstrate incremental business value.

## Scale
- Expand pilot initiatives to the desired scale.
- Realize the expected business benefits.

# AWS Right Sizing
- Amazon EC2 offers many instance types, but choosing the most powerful instance is not always the best option because the cloud is elastic.
- Right sizing is the process of matching instance types and sizes to workload performance and capacity requirements at the lowest possible cost.
- Since scaling up is easy, always start small.
- Analyze deployed instances and identify opportunities to eliminate or downsize resources without affecting capacity or business requirements, reducing costs.

## When to Perform Right Sizing
- Before a cloud migration.
- Continuously after cloud onboarding, as workload requirements change over time.

## Helpful AWS Tools
- Amazon CloudWatch
- AWS Cost Explorer
- AWS Trusted Advisor
- Third-party monitoring and optimization tools

# AWS Ecosystem – AWS Support

## Developer Support
- Business hours email access to Cloud Support Associates.
- General guidance response time: **< 24 business hours**.
- System impaired response time: **< 12 business hours**.

## Business Support
- 24×7 phone, email, and chat access to Cloud Support Engineers.
- Production system impaired: **< 4 hours**.
- Production system down: **< 1 hour**.

## Enterprise Support
- Access to a **Technical Account Manager (TAM)**.
- Concierge Support Team (for billing and account best practices).
- Business-critical system down: **< 15 minutes**.

# AWS Marketplace
- Digital catalog containing thousands of software listings from independent software vendors (3rd-party).

## Examples
- Custom AMIs (custom OS, firewalls, technical solutions, etc.)
- AWS CloudFormation templates
- Software as a Service (SaaS)
- Containers

## Key Points
- Purchases made through AWS Marketplace are added to your AWS bill.
- You can also sell your own solutions on AWS Marketplace.

# AWS Professional Services & Partner Network
- AWS Professional Services is a global team of experts.
- They work alongside your team and a selected member of the APN (AWS Partner Network).

## AWS Partner Network (APN)
- **APN = AWS Partner Network**

### APN Technology Partners
- Provide hardware, connectivity, and software solutions.

### APN Consulting Partners
- Professional services firms that help customers build solutions on AWS.

### APN Training Partners
- Help customers learn AWS through training and certification.

### AWS Competency Program
- AWS Competencies are awarded to APN partners that demonstrate:
  - Technical proficiency
  - Proven customer success
  - Expertise in specialized solution areas

### AWS Navigate Program
- Helps partners become better AWS partners.

# AWS re:Post
- AWS-managed Q&A service that provides crowdsourced, expert-reviewed answers to AWS technical questions.
- Replaces the original AWS Forums.

## Features
- Community members earn reputation points by:
  - Providing accepted answers
  - Reviewing answers from other users
- Questions from AWS Premium Support customers that are not answered by the community are forwarded to AWS Support engineers.

## Note
- AWS re:Post is **not intended** for:
  - Time-sensitive questions
  - Questions involving proprietary or confidential information