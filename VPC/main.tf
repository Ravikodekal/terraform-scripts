provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "Terraform-VPC" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "VPC-TF"
  }
}

resource "aws_subnet" "Terrform-subnet" {
  vpc_id     = aws_vpc.Terraform-VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "VPC-Subnet"
  }
}



resource "aws_route_table" "Terraform-RT" {
  vpc_id = aws_vpc.Terraform-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraform-IGW.id
  }

  tags = {
    Name = "Terraform-RT"
  }
}

resource "aws_route_table_association" "Terraform-RTA" {
    subnet_id = aws_subnet.Terrform-subnet.id
    route_table_id = aws_route_table.Terraform-RT.id
}

resource "aws_security_group" "Terraform-SG" {
  description = "Allow SSH connection from EC2 Instance"
  vpc_id      = aws_vpc.Terraform-VPC.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG-TF"
  }
}

resource "aws_instance" "terraform-ec2" {
    
    subnet_id = aws_subnet.Terrform-subnet.id
    vpc_security_group_ids = [aws_security_group.Terraform-SG.id]
    ami = "ami-0645cf88151eb2007"
    key_name = "terraform"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2-Terraform"
    }
}


resource "aws_internet_gateway" "Terraform-IGW" {
  vpc_id = aws_vpc.Terraform-VPC.id

  tags = {
    Name = "IGW-TF"
  }
}