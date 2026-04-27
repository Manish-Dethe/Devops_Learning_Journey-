# EBS (Elastic Block Store) Overview

- EBS is a **network drive** that you can attach to EC2 instances  
- Allows data to persist even after instance termination  
- Can be attached while instance is running  
- Mounted to **only one EC2 instance at a time** (by default)  
- Bound to a specific **Availability Zone (AZ)**  
- Think of EBS as a **network USB drive**  

## Important Notes
- Some EBS volumes support **multi-attach** (advanced use case)  
- To move volume across AZ → must create a snapshot first  

# EBS Volume
- It is a **network-based storage** (not physical disk)
- Communicates over network → slight latency possible  
- Can be detached and attached to another EC2 instance  
- Locked to a specific AZ  
- Defined by:
  - Size (GB)  
  - IOPS (performance)  
- You are billed for **provisioned capacity**  
- Can increase size over time  

# EBS Delete on Termination
- Controls what happens to EBS when EC2 is terminated  
## Default Behavior
- Root volume → Deleted  
- Additional volumes → NOT deleted  
## Control
- Can be modified via:
  - AWS Console  
  - AWS CLI  
## Use Case
- Preserve root volume after instance termination  

# EBS Snapshots
- Backup of EBS volume at a point in time  
## Key Points
- No need to detach volume (but recommended)  
- Can copy snapshots across:
  - AZ  
  - Region  
## Use Case
- Backup & restore  
- Disaster recovery  

# EBS Snapshot Features
## 1. Snapshot Archive
- Move snapshot to archive tier (~75% cheaper)  
- Restore takes:
  - 24 to 72 hours  
## 2. Recycle Bin
- Retain deleted snapshots  
- Recover after accidental deletion  
### Retention:
- From 1 day to 1 year  

# AMI (Amazon Machine Image)
- AMI = template for EC2 instances  

## What AMI Contains
- Operating system  
- Installed software  
- Configuration  
- Monitoring tools  
## Benefits
- Faster boot time  
- Pre-configured environment  
## Scope
- Built for a specific region  
- Can be copied across regions  