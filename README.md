Data Pipeline for E-commerce Platform

Use Case Overview
Components
1. AWS S3: Stores raw e-commerce transaction data (CSV files).
2. AWS Glue: Extracts, transforms, and loads (ETL) data from S3 into Redshift.
3. AWS Redshift: Stores and analyzes the processed data for reporting.

Terraform Configuration
The Terraform configuration is organized into the following files:
1. provider.tf: Defines AWS as the provider.
2. variables.tf: Contains variable definitions for region, bucket names, database names, etc.
3. main.tf: Creates resources for S3, Glue, Redshift, and IAM roles/policies.
4. outputs.tf: Outputs resource information like the Redshift cluster endpoint and S3 bucket ARN.
