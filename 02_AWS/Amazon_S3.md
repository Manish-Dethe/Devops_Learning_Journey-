# Amazon S3

## S3 Overview
- Amazon S3 is one of the main building blocks of AWS
- It’s advertised as “infinitely scaling” storage
- Many websites use Amazon S3 as a backbone
- Many AWS services use Amazon S3 as an integration as well

# Amazon S3 Use Cases
- Backup and storage
- Disaster Recovery
- Archive  
  - Nasdaq stores 7 years of data into S3 Glacier
- Hybrid Cloud Storage
- Application hosting
- Media hosting
- Data lakes & big data analytics  
  - Sysco runs analytics on its data and gains business insights
- Software delivery
- Static website

# Amazon S3 – Buckets
- Amazon S3 allows people to store objects (files) in “buckets”
- Buckets are defined at a regional level
- S3 looks like a global service but buckets are created in a region
## Naming
- Buckets share a Global Namespace  
  - Must have a globally unique name across all AWS accounts and regions
- Account regional namespace allows reuse of the same bucket name across regions
## Naming Constraints
- No uppercase letters
- No underscore (_)
- Not an IP
- Must start with lowercase letter or number
- Must not start with the prefix `xn--`
- Must not end with the suffix `-s3alias`

# Amazon S3 – Objects
- Objects (files) have a key
- The key is the FULL path:
  - `s3://my-bucket/my-file.txt`
  - `s3://my-bucket/my-folder/another-folder/my-file.txt`
- The key is composed of:
  - Prefix + Object name
- Example:
  - `s3://my-bucket/my-folder/another-folder/my-file.txt`
- There’s no concept of “directories” within buckets  
  (although the UI may make it look like folders exist)
- They are just object keys with long names containing slashes (`/`)

# Amazon S3 – Object Values & Metadata
- Object values are the content of the body
- Maximum object size is 5 TB
- If uploading more than 5 GB, must use “multi-part upload”
## Metadata
- List of text key/value pairs
- Can be system metadata or user metadata
## Tags
- Unicode key/value pairs
- Up to 10 tags
- Useful for:
  - Security
  - Lifecycle management
## Version ID
- Present if versioning is enabled

# Amazon S3 – Security

## User-Based Security
- IAM Policies:
  - Define which API calls should be allowed for a specific IAM user
## Resource-Based Security
### Bucket Policies
- Bucket-wide rules from the S3 console
- Allows cross-account access
### Object Access Control List (ACL)
- Finer-grain permissions
- Can be disabled
### Bucket Access Control List (ACL)
- Less common
- Can be disabled
## Important Note
An IAM principal can access an S3 object if:
- The user IAM permissions ALLOW it  
  **OR**
- The resource policy ALLOWS it
AND
- There is no explicit DENY
## Encryption
- Encrypt objects in Amazon S3 using encryption keys

# S3 Bucket Policies

## JSON-Based Policies
### Components
- Resources:
  - Buckets and objects
- Effect:
  - Allow / Deny
- Actions:
  - Set of APIs to allow or deny
- Principal:
  - The account or user to apply the policy to

## Use S3 Bucket Policies To
- Grant public access to the bucket
- Force objects to be encrypted at upload
- Grant access to another AWS account (Cross-Account)

# Example – Public Access Using Bucket Policy
- Anonymous website visitor accesses S3 bucket
- S3 Bucket Policy allows public access

# Example – User Access to S3 using IAM Permissions
- IAM Policy attached to IAM User
- IAM User accesses S3 Bucket

# Example – EC2 Instance Access using IAM Role
- IAM Role provides permissions
- EC2 Instance accesses S3 Bucket

# Example – Cross-Account Access using Bucket Policy
- IAM User from another AWS account
- S3 Bucket Policy allows cross-account access

# Bucket Settings for Block Public Access
- These settings were created to prevent company data leaks
- If your bucket should never be public, leave these settings ON
- Can also be configured at the account level

# Amazon S3 – Static Website Hosting
- S3 can host static websites and make them accessible on the internet.
- Website URL Format will be (depending on the region):http://bucket-name.s3-website-aws-region.amazonaws.com
OR
http://bucket-name.s3-website.aws-region.amazonaws.com
- If you get a `403 Forbidden` error, make sure the bucket policy allows public reads.

# Amazon S3 – Versioning
- You can version your files in Amazon S3.
- Enabled at the bucket level.
- Same key overwrites create new versions:
  - v1
  - v2
  - v3
## Benefits
- Protect against unintended deletes
- Ability to restore previous versions
- Easy rollback to previous versions
## Notes
- Files uploaded before enabling versioning will have version `null`
- Suspending versioning does not delete previous versions

# Amazon S3 Replication (CRR & SRR)
- Versioning must be enabled on both source and destination buckets.
## Types

### Cross-Region Replication (CRR)
- Replication across AWS regions
### Same-Region Replication (SRR)
- Replication within the same region
## Notes
- Buckets can be in different AWS accounts
- Copying is asynchronous
- Proper IAM permissions are required

## Use Cases
### CRR
- Compliance
- Lower latency access
- Replication across accounts
### SRR
- Log aggregation
- Live replication between production and test accounts

# S3 Storage Classes
- Amazon S3 Standard – General Purpose
- Amazon S3 Standard-IA – Infrequent Access
- Amazon S3 One Zone-IA
- Amazon S3 Glacier Instant Retrieval
- Amazon S3 Glacier Flexible Retrieval
- Amazon S3 Glacier Deep Archive
- Amazon S3 Intelligent-Tiering

## Notes
- Objects can be moved manually
- Objects can also be moved using S3 Lifecycle configurations

# S3 Durability and Availability

## Durability
- Very high durability (`99.999999999%`)
- Objects stored across multiple Availability Zones (AZs)
### Example
If you store `10,000,000` objects in Amazon S3, you can expect to lose a single object once every `10,000 years` on average.
- Same durability across all storage classes

## Availability
- Measures how readily available a service is
- Availability varies depending on the storage class
### Example
- S3 Standard availability = `99.99%`
- Approximate downtime = `53 minutes per year`

# Amazon S3 Standard – General Purpose
- `99.99%` availability
- Used for frequently accessed data
- Low latency and high throughput
- Sustains 2 concurrent facility failures
## Use Cases
- Big data analytics
- Mobile and gaming applications
- Content distribution

# S3 Storage Classes – Infrequent Access
## Amazon S3 Standard-IA
- Used for data accessed less frequently but requiring rapid access
- Lower cost than S3 Standard
- `99.9%` availability
### Use Cases
- Disaster recovery
- Backups

## Amazon S3 One Zone-IA
- Stored in a single Availability Zone (AZ)
- Lower cost than Standard-IA
- High durability within a single AZ
### Notes
- Data is lost if the AZ is destroyed
- `99.5%` availability
### Use Cases
- Secondary backup copies
- Re-creatable data

# Amazon S3 Glacier Storage Classes
- Low-cost storage meant for archiving and backups
- Pricing includes storage cost and object retrieval cost

## Glacier Instant Retrieval
- Millisecond retrieval
- Good for data accessed once every quarter
- Minimum storage duration: `90 days`

## Glacier Flexible Retrieval
Formerly called Amazon S3 Glacier.
### Retrieval Options
- Expedited: `1–5 minutes`
- Standard: `3–5 hours`
- Bulk: `5–12 hours` (free)
### Notes
- Minimum storage duration: `90 days`

## Glacier Deep Archive
- Used for long-term archival storage
### Retrieval Options
- Standard retrieval: `12 hours`
- Bulk retrieval: `48 hours`
### Notes
- Minimum storage duration: `180 days`

# S3 Intelligent-Tiering
- Small monthly monitoring and auto-tiering fee
- Automatically moves objects between access tiers based on usage
- No retrieval charges
## Tiers

### Frequent Access Tier
- Default access tier
### Infrequent Access Tier
- Objects not accessed for `30 days`
### Archive Instant Access Tier
- Objects not accessed for `90 days`
### Archive Access Tier (Optional)
- Configurable from `90 days` to `700+ days`
### Deep Archive Access Tier (Optional)
- Configurable from `180 days` to `700+ days`