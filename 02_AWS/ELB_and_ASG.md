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