## Section Introduction
- When we start deploying multiple applications, they will inevitably need to communicate with one another
- There are two patterns of application communication

### 1. Synchronous communications (application to application)
Buying Service ↔ Shipping Service

### 2. Asynchronous / Event based (application to queue to application)
Buying Service → Queue → Shipping Service

- Synchronous between applications can be problematic if there are sudden spikes of traffic
- What if you need to suddenly code 1000 videos but usually its 20?
- In that case, it's better to decouple your applications:
  - using SQS : queue model
  - using SNS : pub/sub model
  - using Kinesis : real time data streaming model
- These services can scale independently from our applications

# Amazon SQS - Simple Queue Service
- What's a queue?
(producer sends messages to SQS queue and consumers poll messages)

# Amazon SQS - Standard Queue
- Oldest AWS offering (over 10 year old)
- Fully managed service (serverless), used to decouple applications
- Scales from 1 message per second to 10,000s per second
- Default retention of messages : 4 days, max of 14 days
- No limit to how many messages can be in the queue
- Messages are deleted after they’re read by consumers
- Low latency (< 10 ms on publish and receive)
- Consumers share the work to read messages & scale horizontally

- SQS to decouple between application tiers

(Web servers → SQS Queue → Video Processing)

# Amazon SQS - FIFO Queue
- FIFO = First In First Out (ordering of messages in the queue)

Producer → Queue → Consumer
Send messages: 4 3 2 1  
Poll messages: 4 3 2 1
- Messages are processed in order by the consumer

# Amazon Kinesis Data Streams
- For the exam : Kinesis = real-time big data streaming
- Managed services to collect, process, and analyze real time streaming data at any scale
- Amazon Kinesis Data Streams : low latency streaming to ingest data at scale from hundreds of thousands of sources
- Amazon Data Firehose : Load Kinesis Data Streams into Amazon S3, Redshift, OpenSearch, etc..

Sources:
- Click Stream
- IoT devices
- Metrics & logs

Amazon Kinesis Data Streams → Amazon Data Firehose

Destinations:
- Amazon S3
- Amazon Redshift

# Amazon SNS (Simple Notification Service)
- What if you want to send one message to many receivers?
- Direct integration

Buying Service →
- Email notification
- Fraud Service
- Shipping Service
- SQS Queue

# Pub/Sub
Buying Service → SNS Topic →
- Email notification
- Fraud Service
- Shipping Service
- SQS Queue

- The event publishers only sends message to one SNS topic
- As many event subscribers as we want that listen to the SNS topic notifications
- Each subscriber to the topic will get all the messages
- Up to 12,500,000 subscriptions per topic, 100,000 topics limit

SNS

Publish →

Subscribers:
- SQS
- Lambda
- Amazon Data Firehose
- Emails
- SNS & Mobile Applications
- HTTP(s) Endpoint

# Amazon MQ
- SQS, SNS are "cloud-native" services : proprietary protocols from AWS
- Traditional applications running from on premises may use open protocols such as : MQTT, AMQP, STOMP, OpenWire, WSS
- When migrating to the cloud, instead of re-engineering the application to use SQS and SNS, we can use Amazon MQ
- Amazon MQ is a managed message broker service for :
  - RabbitMQ
  - ActiveMQ
- Amazon MQ doesn't "scale" as much as SQS/SNS
- Amazon MQ runs on servers, can run in Multi-AZ with failover
- Amazon MQ has both queue feature (→ SQS) and topic features (→ SNS)

# Cloud Integration Summary

## SQS
- Queue service in AWS
- Multiple producers, messages are kept up to 14 days
- Multiple consumers share the read and delete messages when done
- Used to decouple applications in AWS

## SNS
- Notification service in AWS
- Subscribers : Email, Lambda, SQS, HTTP, Mobile
- Multiple subscribers, send all messages to all of them
- No message retention

## Kinesis
- Real-time data streaming, persistence & analysis

## Amazon MQ
- Managed message broker for ActiveMQ and RabbitMQ in the cloud (MQTT, AMQP, protocols)