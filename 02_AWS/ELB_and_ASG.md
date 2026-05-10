# ELB & ASG – Elastic Load Balancing & Auto Scaling Groups

## High Availability, Scalability, Elasticity
- Scalability means that an application/system can handle greater loads by adapting
- There are two kinds of scalability:
  - Vertical Scalability
  - Horizontal Scalability (= elasticity)
- Scalability is linked to but different from high availability

# Vertical Scalability
- Vertical scalability means increasing the size of the instance
- For example, your application runs on a t2.micro
- Scaling that application vertically means running it on a t2.large
- Vertical scalability is very common for non-distributed systems,
  such as a database
- There’s usually a limit to how much you can vertically scale
  (hardware limit)

# Horizontal Scalability
- Horizontal scalability means increasing the number of instances /
  systems for your application
- Horizontal scaling implies distributed systems
- This is very common for web applications / modern applications
- It’s easy to horizontally scale thanks the cloud offerings such
  as Amazon EC2

# High Availability
- High Availability usually goes hand in hand with horizontal scaling
- High Availability means running your applications / system in at
  least 2 Availability Zones
- The goal of high availability is to survive a data center loss
  (disaster)

# High Availability & Scalability for EC2

## Vertical Scaling
- Increase instance size (= scale up / down)
  - From:
    - t2.nano
    - 0.5 GB of RAM
    - 1 vCPU
  - To:
    - u-12tb1.metal
    - 12.3 TB of RAM
    - 448 vCPUs

## Horizontal Scaling
- Increase number of instances (= scale out / in)
  - Auto Scaling Group
  - Load Balancer

# High Availability
- Run instances for the same applications across Multi-AZ
  - Auto Scaling Group Multi-AZ
  - Load Balancer Multi-AZ

# Scalability vs Elasticity (vs Agility)

## Scalability
- Ability to accommodate a larger load by making
  the hardware stronger (scale up), or by
  adding nodes (scale out)

## Elasticity
- Once a system is scalable, elasticity means that
  there will be some “auto-scaling” so that the
  system can scale based on the load
- This is “cloud-friendly”:
  - Pay-per-use
  - Match demand
  - Optimize costs

## Agility
- (Not related to scalability - distractor)
- New IT resources are only a click away,
  which means that you reduce the time
  to make those resources available to
  your developers from weeks to just minutes

# Elastic Load Balancing (ELB) Overview

## What is Load Balancing?
- Load balancers are servers that forward internet traffic
  to multiple servers (EC2 instances) downstream

# Why use a Load Balancer?
- Spread load across multiple downstream instances
- Expose a single point of access (DNS) to your applications
- Seamlessly handle failures of downstream instances
- Do regular health checks to your instances
- Provide SSL termination (HTTPS) for your websites
- High availability across zones

# Why use an Elastic Load Balancer?
- An ELB (Elastic Load Balancer) is a managed load balancer
- AWS guarantees that it will be working
- AWS takes care of:
  - Upgrades
  - Maintenance
  - High availability
- AWS provides only a few configuration knobs
- It costs less to set up your own load balancer but it will take
  a lot more effort on your end (maintenance, integrations)

# 4 Kinds of Load Balancers Offered by AWS
- Application Load Balancer (HTTP / HTTPS only) – Layer 7
- Network Load Balancer (ultra high performance, allows for TCP) – Layer 4
- Gateway Load Balancer – Layer 3
- Classic Load Balancer (retired in 2023) – Layer 4 & 7

# Application Load Balancer (ALB)
- HTTP / HTTPS / gRPC
- Protocol (Layer 7)
- HTTP routing features
- Static DNS (URL)

# Network Load Balancer (NLB)
- TCP / UDP protocol (Layer 4)
- High performance: millions of requests per second
- Static IP through Elastic IP

# Gateway Load Balancer (GWLB)
- GENEVE protocol on IP
- Packet (Layer 3)
- Route traffic to firewalls that you manage on EC2 instances
- Intrusion detection

# What’s an Auto Scaling Group?
- In real life, the load on your websites and application can change
- In the cloud, you can create and get rid of servers very quickly
- The goal of an Auto Scaling Group (ASG) is to:
  - Scale out (add EC2 instances) to match an increased load
  - Scale in (remove EC2 instances) to match a decreased load
  - Ensure we have a minimum and a maximum number of machines running
  - Automatically register new instances to a load balancer
  - Replace unhealthy instances
- Cost savings: only run at an optimal capacity (principle of the cloud)

# Auto Scaling Group in AWS
- Minimum size
- Actual size / Desired capacity
- Maximum size
- Scale out as needed

# Auto Scaling Group in AWS with Load Balancer
- Web traffic goes to the Load Balancer
- Load Balancer distributes traffic across EC2 instances
- Auto Scaling Group automatically adds/removes EC2 instances based on demand

# Auto Scaling Groups – Scaling Strategies
## 1. Manual Scaling
- Update the size of an ASG manually

## 2. Dynamic Scaling
- Respond to changing demand

### Simple / Step Scaling
- When a CloudWatch alarm is triggered  
  (Ex: CPU > 70%), then add 2 units
- When a CloudWatch alarm is triggered  
  (Ex: CPU < 30%), then remove 1 unit

### Target Tracking Scaling
- Example:  
  “I want the average ASG CPU to stay at around 40%”

### Scheduled Scaling
- Anticipate scaling based on known usage patterns
- Example:
  Increase the minimum capacity to 10 at 5 PM on Fridays

## 3. Predictive Scaling
- Uses Machine Learning to predict future traffic ahead of time
- Automatically provisions the right number of EC2 instances in advance
- Useful when your load has predictable time-based patterns

# ELB & ASG – Summary

## Elastic Load Balancers (ELB)
- Distribute traffic across backend EC2 instances, can be Multi-AZ
- Supports health checks
- 4 types:
  - Classic (old)
  - Application (HTTP – L7)
  - Network (TCP – L4)
  - Gateway (L3)

## Auto Scaling Groups (ASG)
- Implement elasticity for your application across multiple AZ
- Scale EC2 instances based on the demand on your system
- Replace unhealthy instances
- Integrated with the ELB