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