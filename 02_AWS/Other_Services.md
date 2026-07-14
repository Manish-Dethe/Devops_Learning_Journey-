# Other Services

## Amazon WorkSpaces
- Managed Desktop as a Service (DaaS) solution to easily provision Windows or Linux desktops
- Great to eliminate management of on premises VDI (Virtual Desktop Infrastructure)
- Fast and quickly scalable to thousands of users
- Secured data - integrates with KMS
- Pay as you go service with monthly or hourly rates

# Amazon AppStream 2.0
- Desktop Application streaming service
- Deliver to any computer, without acquiring, provisioning infrastructure
- The application is delivered from within a web browser

## Amazon AppStream 2.0 vs WorkSpaces

### WorkSpaces
- Fully managed VDI and desktop available
- The users connect to the VDI and open native or WAM app
- WorkSpaces are on demand or always on

### AppStream 2.0
- Stream desktop applications to web browsers (no need to connect to a VDI)
- Works with any device (that has a web browser)
- Allow to configure an instance type per application type (CPU, RAM, GPU)

# AWS IoT Core
- IoT stands for "Internet of Things" - the network of internet connected devices that are able to collect and transfer data
- AWS IoT Core allows you to easily connect IoT devices to the AWS Cloud
- Serverless, secure & scalable to billions of devices and trillions of messages
- Your applications can communicate with your devices even when they aren't connected
- Integrates with a lot of AWS Services (Lambda, S3, SageMaker, etc)
- Build IoT applications that gather, process, analyze, and act on data

# AWS AppSync
- Store and sync data across mobile and web apps in real-time
- Makes use of GraphQL (mobile technology from Facebook)
- Client code can be generated automatically
- Integrations with DynamoDB / Lambda
- Real time subscriptions
- Offline data synchronization (replaces Cognito Sync)
- Fine Grained Security
- AWS Amplify can leverage AWS AppSync in the background

# AWS Amplify
- A set of tools and services that helps you develop and deploy scalable full stack web and mobile applications
- Authentication, Storage, API (REST, GraphQL), CI/CD, PubSub, Analytics, AI/ML Predictions, Monitoring, Source code from AWS, GitHub, etc...

# AWS Infrastructure Composer
- Visually design and build serverless applications quickly on AWS
- Deploy AWS infrastructure code without needing to be an expert in AWS
- Configure how your resources interact with each other
- Generates Infrastructure as Code (IaC) using CloudFormation
- Ability to import existing CloudFormation / SAM templates to visualize them

# AWS Device Farm
- Fully managed service that tests your web and mobile apps against desktop browsers, real mobile devices, and tablets
- Run tests concurrently on multiple devices (speed up execution)
- Ability to configure device settings (GPS, language, Wi-Fi, Bluetooth, ...)

# AWS Backup
- Fully managed service to centrally manage and automate backups across AWS services
- On demand and scheduled backups
- Supports PITR (Point-in-time Recovery)
- Retention periods, Lifecycle Management, Backup Policies...
- Cross-Region Backup
- Cross-Account Backup (using AWS Organizations)

# Disaster Recovery Strategies

## Backup and Restore
- Cost (low)
- S3 → Servers

## Pilot Light
- Cost (medium)
- EC2 → Servers
- Core functions of the app ready to scale, but minimal setup

## Warm Standby
- Cost (medium high)
- EC2 → Servers
- Full versions of the app but at minimum size

## Multi-Site / Hot-Site
- Cost (high)
- EC2 → Servers
- Full version of the app, at full size

# AWS Elastic Disaster Recovery (DRS)
- Used to be named "CloudEndure Disaster Recovery"
- Quickly and easily recover your physical, virtual and cloud based servers into AWS
- Ex:
  - Protect your most critical databases (including Oracle, MySQL, and SQL Server)
  - Enterprise apps (SAP)
  - Protect your data from ransomware attacks
- Continuous block-level replication for your servers

# AWS DataSync
- Move large amount of data from on-premises to AWS
- Can synchronize to:
  - Amazon S3 (any storage classes including Glacier)
  - Amazon EFS
  - Amazon FSx for Windows
- Replication tasks can be scheduled hourly, daily, weekly
- The replication tasks are incremental after the first full load

# Cloud Migration Strategies: The 7Rs

## Retire
- Turn off things you don't need (maybe as a result of Re-architecting)
- Helps with reducing the surface areas of attacks (more security)
- Save cost, may be up to 10% to 20%
- Focus your attention on resources that must be maintained

## Retain
- Do nothing for now (it's still a decision to make in cloud migration)
- Security, data compliance, performance, unresolved dependencies

## Relocate
- No business value to migrate, maintenance or mid-range and non-x86 Unix apps
- Move apps from on-premises to its cloud version
- Move EC2 instances to a different VPC, AWS account or AWS Region
- Ex: Transfer servers from VMware Software Defined Data Center (SDDC) to VMware Cloud on AWS

## Rehost ("Lift and Shift")
- Simple migrations by re-hosting on AWS (applications, databases, data...)
- Migrate machines (physical, virtual, another cloud) to AWS Cloud
- No cloud optimizations being done, application is migrated as is
- Cloud save as much as 30% on cost
- Ex: Migrate using AWS Application Migration Service

## Replatform ("Lift and Reshape")
- Ex: Migrate your database to RDS
- Ex: Migrate your application to Elastic Beanstalk
- Not changing the core architecture, but leverage some cloud optimizations
- Save time and money by moving to a fully managed service or serverless

## Repurchase ("Drop and Shop")
- Moving to a different product while moving to the cloud
- Often you move to a SaaS platform
- Expensive in the short term, but quick to deploy
- Ex: CRM to Salesforce.com, HR to Workday, CMS to Drupal

## Refactor / Re-architect
- Reimagining how the application is architected using cloud native features
- Driven by the need of the business to add features and improve scalability, performance, security and agility
- Move from a monolithic application to micro-services
- Ex: Move an application to serverless architectures, use AWS S3

# AWS Application Discovery Service
- Plan migration projects by gathering information about on-premises data centers
- Server utilization data and dependency mapping are important for migrations
- Agentless Discovery (AWS Agentless Discovery Connector)
  - VM inventory, configuration and performance history such as CPU, memory and disk usage
- Agent based Discovery (AWS Application Discovery Agent)
  - System configuration, system performance, running processes and details of the network connections between systems
- Resulting data can be viewed within AWS Migration Hub

# AWS Application Migration Service (MGN)
- The "AWS evolution" of CloudEndure Migration, replacing AWS Server Migration Service (SMS)
- Lift and Shift (rehost) solution which simplify migrating applications to AWS
- Converts your physical, virtual and cloud-based servers to run natively on AWS
- Supports wide range of platforms, operating systems, and database
- Minimal downtime, reduced costs

# AWS Migration Evaluator
- Helps you build a data driven business case for migration to AWS
- Provides a clear baseline of what your organization is running today
- Install Agentless Collector to conduct broad based discovery
- Take a snapshot of on-premises foot print, server dependencies...
- Analyze current state, define target state, then develop migration plan

# AWS Migration Hub
- Central location to collect servers and applications inventory data for the assessment, planning, and tracking of migrations to AWS
- Helps accelerate your migration to AWS, automate lift and shift
- AWS Migration Hub Orchestrator
  - Provides prebuilt templates to save time and effort migrating enterprise apps (e.g. SAP, Microsoft SQL Server...)
- Supports migration status updates from:
  - Application Migration Service (MGN)
  - Database Migration Service (DMS)

# AWS Fault Injection Simulator (FIS)
- A fully managed service for running fault injection experiments on AWS workloads
- Based on Chaos Engineering
  - Stressing an application by creating disruptive events (e.g. sudden increase in CPU or memory), observing how the system responds, and implementing improvements
- Helps you uncover hidden bugs and performance bottlenecks
- Supports the following AWS services:
  - EC2
  - ECS
  - EKS
  - RDS
- Use pre-built templates that generate the desired disruptions

# AWS Step Functions
- Build serverless visual workflows to orchestrate your Lambda functions
- Features:
  - Sequence
  - Parallel execution
  - Conditions
  - Timeouts
  - Error handling
- Can integrate with:
  - EC2
  - ECS
  - On-premises servers
  - API Gateway
  - SQS queues
  - etc.
- Supports implementing human approval workflows
- Use cases:
  - Order fulfillment
  - Data processing
  - Web applications
  - Any workflow automation

# AWS Ground Station
- Fully managed service that lets you control satellite communications, process data, and scale your satellite operations
- Provides a global network of satellite ground stations near AWS Regions
- Allows you to download satellite data to your AWS VPC within seconds
- Send satellite data to Amazon S3 or EC2 instances
- Use cases:
  - Weather forecasting
  - Surface imaging
  - Communications
  - Video broadcasts

# Amazon Pinpoint
- Scalable two-way (outbound/inbound) marketing communication service
- Supports:
  - Email
  - SMS
  - Push notifications
  - Voice
  - In-app messaging
- Ability to segment and personalize messages with the right content for customers
- Supports receiving customer replies
- Scales to billions of messages per day
- Use cases:
  - Marketing campaigns
  - Bulk messaging
  - Transactional SMS messages

## Amazon Pinpoint vs Amazon SNS / Amazon SES

### Amazon SNS & Amazon SES
- You manage each message's audience, content, and delivery schedule

### Amazon Pinpoint
- Create message templates
- Configure delivery schedules
- Target highly specific customer segments
- Manage complete marketing campaigns