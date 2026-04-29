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
# Types of AMI
## 1. Public AMI
- Provided by AWS  
## 2. Custom AMI
- Created and managed by you  
## 3. Marketplace AMI
- Created by third parties  
- Can be paid or free  

# AMI Creation Process
1. Launch EC2 instance  
2. Customize it (install software, config)  
3. Stop instance (for data consistency)  
4. Create AMI  
   - Automatically creates EBS snapshots  
5. Launch new instances from AMI  

# EC2 Image Builder
- Used to **automate creation of VM or container images (AMIs)**  
- Automates:
  - Creation  
  - Maintenance  
  - Validation  
  - Testing of AMIs  

## Features
- Can run on a **schedule**
  - Weekly  
  - On package updates  

- **Free service**
  - You only pay for underlying resources (EC2, storage, etc.)

## Workflow
1. Start with base image  
2. Apply build components (install software, configs)  
3. Create new AMI  
4. Launch test instance  
5. Run tests (security, validation)  
6. Distribute AMI (can be multi-region)  

# EC2 Instance Store

- High-performance **local storage (attached to physical host)**  
## Characteristics
- Better I/O performance than EBS  
- **Ephemeral storage** (temporary)  
- Data is LOST when:
  - Instance stops  
  - Instance terminates  
## Use Cases
- Buffer / cache  
- Scratch data  
- Temporary files  
## Important
- No automatic backup  
- Backup & replication = **your responsibility**  

# EFS (Elastic File System)
- Managed **NFS (Network File System)**  
- Can be mounted on **multiple EC2 instances simultaneously**  
## Features
- Works with **Linux EC2 instances**  
- Supports **multi-AZ access**  
- Highly available & scalable  
- Pay per use (no capacity planning)  
## Notes
- More expensive than EBS  
- Ideal for shared file systems  

# EBS vs EFS

| Feature        | EBS                         | EFS                          |
|---------------|-----------------------------|------------------------------|
| Type          | Block storage               | File storage (NFS)           |
| Attachment    | One instance (mostly)       | Multiple instances           |
| AZ Scope      | Single AZ                   | Multi-AZ                     |
| Performance   | High                        | Moderate                     |
| Use Case      | Databases, OS disks         | Shared file systems          |
| Cost          | Cheaper                     | More expensive               |


# EFS Storage Classes
## 1. Standard
- For frequently accessed data  
## 2. Infrequent Access (EFS-IA)
- For files not accessed often  
- Up to **~90% cheaper**  

## Lifecycle Policy
- Automatically move files to EFS-IA  
- Example:
  - Move files not accessed for 60 days  
## Benefit
- Transparent to application  
- Cost optimized automatically  