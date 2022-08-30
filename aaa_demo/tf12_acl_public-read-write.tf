terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "my-tf-log-bucket"
  acl = "log-delivery-write"
  tags = {
    Region = "us-east-1"
    Demo = "log-delivery-write"
    Version = "12"
  }
}

resource "aws_s3_bucket" "log_bucket_log_bucket" {
  bucket = "log_bucket-log-bucket"
}

resource "aws_s3_bucket_logging" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id

  target_bucket = aws_s3_bucket.log_bucket_log_bucket.id
  target_prefix = "log/"
}