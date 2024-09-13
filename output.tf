output "s3_bucket_name" {
  value = aws_s3_bucket.ecommerce_data_bucket.bucket
}

output "redshift_cluster_endpoint" {
  value = aws_redshift_cluster.ecommerce_redshift.endpoint
}
