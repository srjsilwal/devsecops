# 1. Define the provider
provider "aws" {
  region = "us-east-1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
} 

resource "aws_s3_bucket" "vault_test_bucket" {
  bucket = "vault-test-bucket-${random_id.bucket_suffix.hex}"
  tags = {
    Name        = "vault-test-bucket"
    Environment = "Test"
    managed_by  = "Terraform"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.vault_test_bucket.bucket
  
}