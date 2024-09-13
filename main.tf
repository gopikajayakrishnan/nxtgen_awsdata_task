# Create S3 bucket for raw data
resource "aws_s3_bucket" "ecommerce_data_bucket" {
  bucket = var.s3_bucket_name
}

# Create Glue Role and Policy
resource "aws_iam_role" "glue_role" {
  name = "AWSGlueServiceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "glue_policy" {
  role       = aws_iam_role.glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

# Create Glue Crawler
resource "aws_glue_crawler" "ecommerce_crawler" {
  name         = "ecommerce-crawler"
  role         = aws_iam_role.glue_role.arn
  database_name = var.db_name
  s3_target {
    path = "s3://${aws_s3_bucket.ecommerce_data_bucket.bucket}"
  }
}

# Create Redshift Cluster
resource "aws_redshift_cluster" "ecommerce_redshift" {
  cluster_identifier = var.redshift_cluster_id
  database_name      = var.db_name
  master_username    = "admin"
  master_password    = "YourPassword123"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
}

# Grant Glue access to Redshift
resource "aws_iam_role_policy_attachment" "redshift_access" {
  role       = aws_iam_role.glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftFullAccess"
}