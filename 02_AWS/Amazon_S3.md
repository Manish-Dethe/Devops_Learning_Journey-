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