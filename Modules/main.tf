provider "aws" {
    region = "ap-south-1"
}

module "Module-EC2" {
    subnet-id = module.Module-VPC.subnet_ids
    source = "./module/create-ec2"
    key-name = "terraform"
    ami = "ami-0645cf88151eb2007"
    instance-type = "t2.micro"
    instance-name = "Terraform-EC2"
}

module "Module-VPC" {
  source = "git::https://github.com/saikiran-sayabugari/terraform-modules.git//modules/create_vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "Terraform-VPC"
  subnet_name = "terraform-subnet"
  subnet_cidr = "10.0.1.0/24"
  subnet_zone = "ap-south-1a"
  igw_name = "terraform-IGW"
  public_crt_name = "Terraform-route"
}


