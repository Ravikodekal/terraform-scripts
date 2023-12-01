resource "aws_instance" "terraform-ec2" {
    provider = aws.singapore
    ami = "ami-0a1aabd978d1ea0a5"
    key_name = "terraform"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2-Terraform"
    }
}
resource "aws_instance" "terraform-ec2-2" {
    ami = "ami-0645cf88151eb2007"
    key_name = "terraform"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2-Terraform-mumbai"
    }
}

provider "aws" {
    region = "ap-south-1"
}

provider "aws" {
  alias = "singapore"
  region = "ap-southeast-1"
}