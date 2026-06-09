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