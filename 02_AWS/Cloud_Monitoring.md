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