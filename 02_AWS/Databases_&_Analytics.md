# Databases & Analytics

# Database Introduction
- Storing data on disks (EFS, EBS, EC2 Instance Store, S3) can have limitations.
- Sometimes you want to store data in a database.
- You can structure data.
- Build indexes to efficiently query/search through data.
- Define relationships between datasets.
- Databases are optimized for specific purposes and come with different features, shapes, and constraints.

# Relational Databases
- Similar to Excel spreadsheets with links between tables.
- Uses SQL language to perform queries/lookups.

# NoSQL Databases
- Non-SQL = Non-relational databases.
- Purpose-built for specific data models.
- Flexible schemas for modern applications.
## Benefits
- Flexibility: easy to evolve data model
- Scalability: distributed clusters
- High performance: optimized for specific models
- Highly functional database types
## Examples
- Key-value
- Document
- Graph
- In-memory search databases
### Example Data Format: JSON
- JSON = JavaScript Object Notation
- Common data representation in NoSQL
- Data can be nested
- Fields can change over time
- Supports arrays and more

# Databases & Shared Responsibility on AWS
AWS managed database benefits:
- Quick provisioning
- High availability
- Vertical and horizontal scaling
- Automated backup and restore
- Automatic patching/upgrades
- Monitoring handled by AWS
Note:
- Databases can run on EC2.
- In that case, resilience, patching and backup become your responsibility.

# RDS Overview
RDS = Relational Database Service
- Managed database service using SQL
- AWS manages the infrastructure
Supported engines:
- PostgreSQL
- MySQL
- MariaDB
- Oracle
- Microsoft SQL Server
- IBM DB2
- Aurora

# Advantages of RDS vs Database on EC2
- Automated provisioning
- OS patching
- Continuous backups
- Point-in-Time Restore (PITR)
- Monitoring dashboards
- Read replicas
- Multi-AZ setup (Disaster Recovery)
- Maintenance windows
- Vertical and horizontal scaling
- Storage backed by EBS
Limitation:
- Cannot SSH into RDS instances

# RDS Solution Architecture
Elastic Load Balancer
        ↓
EC2 instances (possibly ASG)
        ↓
Amazon RDS
        ↓
SQL Relational Database

# Amazon Aurora
- AWS proprietary database technology
- PostgreSQL and MySQL supported
Features:
- AWS cloud optimized
- Up to 5x MySQL performance
- More than 3x PostgreSQL performance
- Storage auto grows in increments of 10 GB
- Supports up to 256 TB
- Costs roughly 20% more than RDS but is more efficient

# Amazon Aurora Serverless
Features:
- Automated DB instantiation
- Auto-scaling based on usage
- PostgreSQL and MySQL supported
- No capacity planning needed
- Less management overhead
- Pay per second
- Cost effective
Use cases:
- Infrequent workloads
- Intermittent workloads
- Unpredictable workloads

Architecture:

Client
   ↓
Proxy Fleet (Managed by Aurora)
   ↓
Aurora Instances
   ↓
Shared Storage Volume

# RDS Deployments: Read Replicas, Multi-AZ, Multi-Region
## Read Replicas
Purpose:
- Scale the read workload of your database
- Can create up to 15 read replicas
- Data is written only to the main database

Characteristics:
- Read traffic goes to replicas
- Write traffic goes to main database
- Uses replication from main DB

Architecture:

Application
    |
    |---- Read ----> Read Replica
    |
    |---- Write ---> Main DB
    |
    |---- Read ----> Read Replica

Replication:
Main DB --> Read Replica(s)

## Multi-AZ
Purpose:
- High availability
- Automatic failover during AZ outage

Characteristics:
- Data written to main database
- Replication to standby database
- Only one standby AZ used as failover

Architecture:

Main DB ----Replication----> Failover DB

Application
      |
      |---- Read/Write ----> Main DB

If main DB fails:
Application ---> Failover DB

## Multi-Region (Read Replicas)
Purpose:
- Disaster recovery during region failures
- Better local performance for global reads

Characteristics:
- Read replicas exist across regions
- Replication cost applies

Example Architecture:

US-East-2             EU-East-1             AP-Southeast-2

Read Replica  <---- Main DB ----> Read Replica

Applications         Applications           Applications

Read locally          Write to Main         Read locally

# Amazon ElastiCache Overview
- Similar to RDS but for managed Redis or Memcached
- Cache is an in-memory database
- High performance
- Low latency
- Reduces database load for read-intensive workloads

AWS handles:
- OS maintenance
- Patching
- Optimizations
- Setup
- Configuration
- Monitoring
- Failure recovery
- Backups

## ElastiCache Solution Architecture

Client
   |
Elastic Load Balancer
   |
EC2 Instances (ASG)
   |
   |---- Read/Write Fast ----> ElastiCache
   |
   |---- Read/Write Slow ----> Amazon RDS