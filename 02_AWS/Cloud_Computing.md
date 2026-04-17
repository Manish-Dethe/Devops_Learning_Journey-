# What is Cloud Computing
- On-demand delivery of compute power & storage  
- Pay-as-you-go pricing  
- Provision resources instantly  
- Access resources anytime  
- Easy access to servers, storage, databases  
- AWS manages infrastructure  
- You use services via web  
- Ex : - Gmail, Dropbox, Google Photos, Netflix 

# Deployment Models

## Private Cloud
- Used by a single organization  
- Not public  
- Full control  
- High security  
- Meets business needs  

## Public Cloud
- Provided by AWS, Azure, GCP  
- Owned by third-party providers  
- Delivered over internet  

# Hybrid Cloud
- Keep some servers on-premises and extend capabilities to cloud  
- Control over sensitive assets  
- Flexibility + cost effectiveness  

## Five Characteristics of Cloud Computing
1. On-demand self service  
2. Broad network access  
3. Multi-tenancy & resource pooling  
4. Rapid elasticity & scalability  
5. Measured service  

## Six Advantages of Cloud Computing
- Trade CAPEX (Capital Expense) → OPEX (Operational Expense) 
- Pay on demand (no hardware ownership)  
- Reduced TCO (Total Cost of Ownership)
- Benefit from economies of scale  
- Stop guessing capacity  
- Increase speed & agility  
- No need to run data centers  
- Go global in minutes  

## Problems Solved by Cloud
- Flexibility  
- Cost effectiveness  
- Scalability  
- Elasticity  
- High availability  
- Fault tolerance  
- Agility  

# Types of Cloud Computing

## IaaS (Infrastructure as a Service)
- Provides building blocks for IT  
- Includes networking, computes, storage  
- Highest flexibility  
- Similar to traditional IT  

## PaaS (Platform as a Service)
- No need to manage infrastructure  
- Focus on application deployment  

## SaaS (Software as a Service)
- Fully managed product  
- Runs and maintained by provider

## Responsibility Comparison

| Component       | On-Prem | IaaS | PaaS | SaaS |
|----------------|--------|------|------|------|
| Applications   | ✔️     | ✔️   | ✔️   | ❌   |
| Data           | ✔️     | ✔️   | ✔️   | ❌   |
| Runtime        | ✔️     | ✔️   | ❌   | ❌   |
| Middleware     | ✔️     | ✔️   | ❌   | ❌   |
| OS             | ✔️     | ✔️   | ❌   | ❌   |
| Virtualization | ✔️     | ❌   | ❌   | ❌   |
| Servers        | ✔️     | ❌   | ❌   | ❌   |
| Storage        | ✔️     | ❌   | ❌   | ❌   |
| Networking     | ✔️     | ❌   | ❌   | ❌   |

✔️ = Managed by you  
❌ = Managed by provider

# Examples of Cloud Types

## IaaS
- AWS EC2  
- GCP  
- Azure  
- DigitalOcean  
- Linode  

## PaaS
- AWS Elastic Beanstalk  
- Heroku  
- Google App Engine  
- Azure  

## SaaS
- Gmail  
- Dropbox  
- Zoom  
- AWS Rekognition  

# AWS Use Cases
- Enterprise IT  
- Backup & Storage  
- Big Data Analytics  
- Website Hosting  
- Mobile Apps  
- Social Apps  
- Gaming  

# AWS Global Infrastructure
- Regions  
- Availability Zones  
- Data Centers  
- Edge Locations  

# AWS Regions
- Available worldwide  
- Example: us-east-1, eu-west-3  
- Region = cluster of data centers  
- Most services are region-based  

# How to Choose AWS Region
- Compliance & legal requirements  
- Data residency  
- Latency (closer = faster)  
- Service availability  
- Pricing varies by region 

# AWS Availability Zones
- Each region has multiple AZs (usually 3, min 3, max 6)  
- Example:
  - ap-south-1a  
  - ap-south-1b  
  - ap-south-1c  

- AZ = one or more data centers  
- Connected with high-speed networking  
- Separate to avoid failures  

# AWS Edge Locations (Points of Presence)
- 400+ PoPs globally  
- 40+ countries  
- Used for low latency content delivery  
 
# Tour of the AWS Console

## AWS Global Services
- IAM (Identity & Access Management)
- Route 53 (DNS Service)
- CloudFront (Content Delivery Network)
- WAF (Web Application Firewall)

## Region Scoped Services
- Amazon EC2 (IaaS)
- Elastic Beanstalk (PaaS)
- Lambda (Function as a Service)
- Rekognition (AI/ML Service)
- Most AWS services are regioned scoped (Amazon EC2(IaaS), Elastic Beanstalk(PaaS), Lambda(Function as a service), Rekognition(SaaS))
