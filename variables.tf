variable "region" {
  default = "us-west-2"
}

variable "s3_bucket_name" {
  default = "ecommerce-data-bucket"
}

variable "redshift_cluster_id" {
  default = "ecommerce-redshift-cluster"
}

variable "db_name" {
  default = "ecommerce_db"
}
