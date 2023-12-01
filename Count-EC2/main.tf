provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "terraform-ec2" {
    ami = "ami-0645cf88151eb2007"
    key_name = "terraform"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2-Terraform ${count.index}"
    }
    count = 3
}


output "instance-publicIP" {
    value = aws_instance.terraform-ec2.*.public_ip
}