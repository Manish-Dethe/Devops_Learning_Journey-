# Leveraging the AWS Global Infrastructure

# Why Global Applications ?
- A global application is an application deployed in multiple geographies
- On AWS : this could be Regions and / or Edge locations
- Decreased Latency
  - Latency is the time it takes for a network packet to reach a server
  - It takes time for a packet from Asia to reach the US
- Deploy your applications closer to your users to decrease latency, better experience
- Disaster Recovery (DR)
  - If an AWS region goes down (earthquake, storms, power shutdown, politics...)
  - You can fail-over to another region and have your application still working
  - A DR plan is important to increase the availability of your application
- Attack protection : distributed global infrastructure is harder to attack

# Global AWS Infrastructure
- Regions : for deploying applications and infrastructure
- Availability Zones : made of multiple data centers
- Edge Locations (Point of Presence) : for content delivery as close as possible to users

# Global Applications in AWS
- Global DNS : Route 53
  - Great to route users to the closest deployment with least latency
  - Great for disaster recovery strategies

- Global Content Delivery Network (CDN) : CloudFront
  - Replicate part of your application to AWS Edge Locations
  - Decrease latency
  - Cache common requests - improved user experience and decreased latency

- S3 Transfer Acceleration
  - Accelerate global uploads & downloads into Amazon S3

- AWS Global Accelerator :
  - Improve global application availability and performance using the AWS global network

# Amazon Route 53 Overview
- Route53 is a Managed DNS (Domain Name System)
- DNS is a collection of rules and records which helps clients understand how to reach a server through URLs

- In AWS the most common records are:
  - www.google.com → 12.34.56.78 = A record (IPv4)
  - www.google.com → 2001:0db8:5803:00 = AAAA IPv6
  - search.google.com => www.google.com = CNAME (hostname redirection)
  - example.com → AWS resource => Alias (ex: ELB, CloudFront, S3 website)

# Route 53 - Diagram For a Record

- Web browser
  - HTTP request
  - IP : 32.45.67.89

- DNS request
  - myapp.mydomain.com

- Route53
  - send back IP : 10.32.45.67.89
  - (A record / hostname IP)

- HTTP Response

- Application server
  - IP : 32.45.67.89

# Route 53 Routing Policies
- Need to know them at a high level for cloud practitioner exam

## SIMPLE ROUTING POLICY
- No health checks

## WEIGHTED ROUTING POLICY
- Weight 70%
- Weight 20%
- Weight 10%

## LATENCY ROUTING POLICY
- Application is global, then for users it will send them to the nearest EC2 (server) & connect with it

## FAILOVER ROUTING
- Health checks
- Primary
- Failover

# AWS CloudFront
- Content Delivery Network (CDN)
- Improves read performance, content is cached at the edge
- Improves users experience
- Hundreds of points of presence globally (edge locations, edge caches)
- DDoS protection (because worldwide), integration with Shield, AWS Web Application Firewall

# CloudFront - Origins
- S3 bucket
  - For distributing files and caching them at the edge
  - For uploading files to S3 through CloudFront
  - Secured using Origin Access Control (OAC)

- VPC Origin
  - For applications hosted in VPC private subnets
  - Private Application Load Balancer / Network Load Balancer
  - EC2 Instances

- Custom Origin (HTTP)
  - S3 Website (must first enable the bucket as a static S3 website)
  - Any public HTTP backend you want (ex : Public ALB)

# CloudFront at a high level

- Client
- CloudFront Edge Location
  - Cache
  - Local Cache
- Origin
  - S3
  - HTTP
- Forward Req. to your origin
Request Example:
- GET /beach.jpg?size=300x300 HTTP/1.1
- User-Agent: Mozilla/4.0 (compatible; MSIE5.01; Windows NT)
- Host: www.example.com
- Accept-Encoding: gzip, deflate

# CloudFront - S3 as an origin
- AWS Cloud
  - Edge Los Angeles
  - Edge Mumbai
  - Edge Sao Paulo
  - Edge Melbourne
- Origin (S3 Bucket)
- OAC
- Origin Access Control + S3 Bucket Policy
- Public WWW
- Private AWS

# CloudFront vs S3 Cross Region Replication

## CloudFront
- Global Edge network
- Files are cached for a TTL (maybe a day)
- Great for static content that must be available everywhere

## S3 Cross Region Replication
- Must be setup for each region you want replication to happen
- Files are updated in near real-time
- Read only
- Great for dynamic content that needs to be available at low latency in few regions

# S3 Transfer Acceleration
- Increase transfer speed by transferring file to an AWS edge location which will forward the data to the S3 bucket in the target region

- File in VSH
- Edge Location
- Private AWS
- S3 Bucket
- Australia

# AWS Global Accelerator
- Improve global application availability and performance using the AWS global network
- Leverage the AWS internal network to optimize the route to your application (60% improvement)
- 2 Anycast IP are allocated for your application and traffic is sent through Edge Locations.
- The Edge locations send the traffic to your application

# AWS Global Accelerator vs CloudFront
- They both use the AWS global network and its edge locations around the world
- Both services integrate with AWS Shield for DDoS protection

- CloudFront
  - Content Delivery Network
  - Improves performance for your cacheable content (such as images and videos)
  - Content is served at the edge

- Global Accelerator
  - No caching, proxying packets at the edge to applications running in one or more AWS regions
  - Improve performance for a wide range of applications over TCP or UDP
  - Good for HTTP use cases that require static IP addresses
  - Good for HTTP use cases that required deterministic, fast regional failover

# AWS Outposts
- Hybrid cloud : business that keep an on-premise infrastructure alongside a cloud infrastructure
- Therefore, two ways of dealing with IT systems
  - One for the AWS cloud (using the AWS console, CLI and APIs)
  - One for their on-premises infrastructure

- AWS Outposts are "server racks" that offers the same AWS infrastructure, services, APIs & tools to build your own applications on-premises just as in the cloud
- AWS will setup and manage "outposts" within your on-premise infrastructure and you can start leveraging AWS services on premises
- You are responsible for the outpost rack physical security

# Benefits
- Low latency access to on premises systems
- Local data processing
- Data residency
- Easier migration from on premises to the cloud
- Fully managed service

- Some services that works on Outposts
  - Amazon EC2
  - Amazon EBS
  - Amazon S3
  - Amazon EKS
  - Amazon ECS
  - Amazon RDS
  - Amazon EMR

# AWS Wavelength
- Wavelength zones are infrastructure deployments embedded within the telecommunications providers datacenters at the edge of the 5G networks
- Brings AWS services to the edge of the 5G networks
- Ex - EC2, EBS, VPC...
- Ultra low latency applications through 5G networks
- Traffic doesn't leave the communication service providers (CSP) network
- High bandwidth and secure connection to the parent AWS Region
- No additional charges or service agreements
- Use cases : Smart cities, ML-assisted diagnostics, connected vehicles, Interactive Live video streams, AR/VR, Real time Gaming

# AWS Local Zones
- Places AWS compute, storage, database and other selected AWS services closer to end users to run latency sensitive applications
- Extend your VPC to more locations - "Extended of AWS Region"
- Compatible with EC2, RDS, ECS, EBS, ElastiCache, Direct Connect...
- Example
  - AWS Region : N. Virginia (us-east-1)
  - AWS Local Zones : Boston, Chicago, Dallas, Houston, Miami..

# Global Applications Architecture

## Single Region, Single AZ
- High Availability (X)
- Global latency (X)
- Difficulty (low)

## Single Region, Multi AZ
- High Availability (✓)
- Global latency (X)
- Difficulty (medium)

## Multi Region, Active-Passive
- Global Read's Latency (✓)
- Global Write's Latency (X)
- Difficulty (medium-high)

## Multi Region, Active-Active
- Read's Latency (✓)
- Write's Latency (✓)
- Difficulty (high)

# Leveraging the AWS Global Infrastructure - Summary

## Global DNS : Route 53
- Great to route users to the closest deployment with least latency
- Great for disaster recovery strategies

## Global Content Delivery Network (CDN) : CloudFront
- Replicate part of your applications to AWS Edge Locations, decrease latency
- Cache common requests - improved user experience and decreased latency

## S3 Transfer Acceleration
- Acceleration global uploads & downloads into Amazon S3

## AWS Global Accelerator
- Improve global applications availability and performance using the AWS global network

## AWS Outposts
- Deploy Outposts Racks in your own Data Centers to extend AWS services

## AWS Wavelength
- Brings AWS services to the edge of the 5G network
- Ultra low latency applications

## AWS Local Zones
- Bring AWS resources (compute, database, storage...)
  closer to your users
- Good for latency sensitive applications