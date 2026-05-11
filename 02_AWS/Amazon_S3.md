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