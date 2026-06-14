# Cloud Monitoring

## CloudWatch Metrics & CloudWatch Alarm Overview

# Amazon CloudWatch Metrics
- CloudWatch provides metrics for every service in AWS
- Metric is a variable to monitor (CPUUtilization, NetworkIn, etc.)
- Metrics have timestamps
- Can create CloudWatch Dashboards of metrics

### Important Metrics

## EC2 Instances
- CPU Utilization
- Status Checks
- Network (not RAM)
- Default metrics every 5 minutes
- Detailed monitoring (extra cost) → metrics every 1 minute

#### EBS Volumes
- Disk Read / Writes

#### S3 Bucket
- BucketSizeBytes
- NumberOfObjects
- AllRequests

#### Billing
- Total Estimated Charge (only in us-east-1)

#### Service Limits
- How much you've been using a service API

#### Custom Metrics
- Push your own metrics

# Amazon CloudWatch Alarms
- Alarms are used to trigger notifications for any metric
- Alarm Actions:
  - EC2 Actions:
    - Stop
    - Terminate
    - Reboot
    - Recover an EC2 instance
  - SNS Notifications:
    - Send notification to an SNS Topic

### Auto Scaling
- Increase or decrease EC2 instances based on desired count

### Alarm Configuration
- Various options:
  - Sampling
  - Maximum
  - Minimum
  - Average
- Can choose the evaluation period
### Example
Create a billing alarm on the CloudWatch Billing metric.

### Alarm States
- OK
- INSUFFICIENT_DATA
- ALARM

# Amazon CloudWatch Logs
CloudWatch Logs can collect logs from:
- Elastic Beanstalk
- ECS (container logs)
- AWS Lambda (function logs)
- CloudTrail
- CloudWatch Log Agent on EC2 or on-premises servers
- Route 53 DNS Queries

### Features
- Real-time monitoring of logs
- Adjustable log retention period
- Filter-based log analysis

# CloudWatch Logs for EC2
- By default, logs from EC2 instances do not go to CloudWatch
- Install CloudWatch Agent on EC2 to push logs
- Ensure proper IAM permissions
- CloudWatch Agent can also be installed on on-premises servers

# Amazon EventBridge (formerly CloudWatch Events)

## Scheduled Events
- Cron jobs (scheduled scripts)
- Example:
  - Run every hour
  - Trigger a script or Lambda function

## Event Pattern
- Event rules react to AWS service events

Example Flow:

IAM Root User Sign In
        ↓
EventBridge Event
        ↓
SNS Topic
        ↓
Email Notification

- Trigger Lambda functions, send SQS/SNS messages

# Amazon EventBridge
- AWS Services (EC2, Lambda, S3) → Default Event Bus
- AWS SaaS Partners (Zendesk, DataDog) → Partner Event Bus
- Custom Apps → Custom Event Bus

- Schema Registry: model event schema
- You can archive events (all/filter) sent to an event bus (indefinitely or set period)
- Ability to replay archived events

# AWS CloudTrail
- Provides governance, compliance and audit for your AWS account
- CloudTrail is enabled by default
- Get a history of events / API calls made within your AWS account by:
  - Console
  - SDK
  - CLI
  - AWS Services

- Can put logs from CloudTrail into CloudWatch Logs or S3
- A trail can be applied to all regions (default) or single region
- If a resource is delete in AWS, investigate CloudTrail first!

# AWS X-Ray
- Visual analysis of our applications

## Debugging in Production, the good old way:
- Test locally
- Add log statements everywhere
- Re-deploy in production

- Log formats differ across applications and log analysis is hard
- Debugging: one big monolith "easy", distributed services "hard"
- No common view of your entire architecture

## AWS X-Ray advantages
- Troubleshooting performance (bottlenecks)
- Understand dependencies in a microservice architecture
- Pinpoint service issues
- Review request behavior
- Find errors and exceptions
- Are we meeting time SLA?
- Where I am throttled?
- Identify users that are impacted

# AWS Health Dashboard

## Service History
- Show all regions, all services health
- Show historical information for each day
- Has an RSS feed you can subscribe to
- Previously called AWS Service Health Dashboard

## Your Account
- Previously called AWS Personal Health Dashboard (PHD)
- AWS Account Health Dashboard provides alerts and remediation guidance when AWS is experiencing events that may impact you
- While the Service Health Dashboard displays the general status of AWS services, Account Health Dashboard gives you a personalized view into the performance and availability of the AWS services underlying your AWS resources
- The dashboard displays relevant and timely information to help you manage events in progress and provides proactive notification to help you plan for scheduled activities
- Can aggregate data from an entire AWS organization

## Global Service
- Shows how AWS outages directly impact you & your AWS resources
- Alerts, Remediation, proactive, scheduled activities

# Monitoring Summary

## CloudWatch
- Metrics: monitor the performance of AWS services and billing metrics
- Alarms: automate notifications, perform EC2 action, notify to SNS based on metric

## Logs
- Collect log files from EC2 instances, servers, Lambda functions

## Events (or EventBridge)
- React to events in AWS, or trigger a rule on a schedule

## CloudTrail
- Audit API calls made within your AWS account

## CloudTrail Insights
- Automated analysis of your CloudTrail events

## X-Ray
- Trace requests made through your distributed application

## AWS Health Dashboard
- Status of all AWS services across all regions

## AWS Account Health Dashboard
- AWS events that impact your infrastructure