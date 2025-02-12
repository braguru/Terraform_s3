# README for Deploying Amalitech Static Website on S3 Using Terraform
## Purpose
This project enables the deployment of a static website to an Amazon S3 bucket using Terraform. The website will serve HTML files, such as index.html and error.html, to users. The goal is to automate the infrastructure setup and deployment process, ensuring that the website is always deployed with the correct configuration.

This project deploys the static website to a predefined S3 bucket named princes3labbucket.

## Requirements
Before deploying the project, ensure that the following tools are installed and configured:

1. AWS CLI: Command-line interface for managing AWS resources.

- **Install AWS CLI**
2. Terraform: A tool for Infrastructure as Code (IaC) to automate and manage AWS infrastructure.

- **Install Terraform**
3. AWS IAM User with Permissions: Make sure the AWS user has necessary permissions to interact with S3 and manage resources.

Required permissions:

- s3:CreateBucket
- s3:PutBucketPolicy
- s3:PutBucketWebsite

4. An AWS Account: You will need an active AWS account to deploy the infrastructure.

### Steps to Deploy the Project

1. **Create index.html and error.html files**
2. **Configure AWS CLI**
```bash
aws configure
```
3. **Initialize Terraform**
``` bash
terraform init
```
#### Expected output
``` bash
Initializing the backend...
Initializing provider plugins...
- Finding latest version of hashicorp/aws...
```

4. **Apply Terraform Configuration**
``` bash
terraform apply
```

#### Expected output
``` bash 
Terraform will perform the following actions:

  # aws_s3_bucket.static_site will be created
  + resource "aws_s3_bucket" "static_site" {
      ...
    }

  # aws_s3_bucket_website_configuration.site_configuration will be created
  + resource "aws_s3_bucket_website_configuration" "site_configuration" {
      ...
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions? Terraform will perform the following actions:
  + create the AWS S3 bucket.
  + configure the bucket for static website hosting.

```

5. **Access the website**
#### Expected output
``` bash
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

website_endpoint = "http://princes3labbucket.s3-website-us-west-2.amazonaws.com"

```
