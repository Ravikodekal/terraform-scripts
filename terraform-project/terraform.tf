terraform {
  required_version = ">=1.6.3"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=5.24.0"
    }
  
}
backend "s3" {
  bucket = "s3-bucket-terraform-backend-12345679878"
  region = "ap-south-1"
  key = "terraform/terraform-project/terraform.tfstate"

  dynamodb_table = "dynamodb-terraform-backend"
  encrypt = true
  
}
}