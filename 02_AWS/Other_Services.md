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