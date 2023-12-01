provider "aws" {
    region = "ap-south-1"
}


resource "aws_s3_bucket" "Terraform-s3" {
  bucket = "s3-bucket-terraform-backend-12345679878"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "Terraform-s3-versioning" {
  bucket = aws_s3_bucket.Terraform-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "Terraform-dynamodb" {
  name           = "dynamodb-terraform-backend"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}