provider "aws" {
    region = "ap-south-1"
}

data "aws_instance" "Data-EC2" {
  instance_tags = {
    Name = "Test"
  }
}

output "data-id" {
    value = data.aws_instance.Data-EC2.id
}

output "data-publicip" {
    value = data.aws_instance.Data-EC2.public_ip
}

