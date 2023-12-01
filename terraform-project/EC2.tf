resource "aws_instance" "terraform-ec2" {
    ami = var.instance-ami
    key_name = "terraform"
    instance_type = var.instance-type
    tags = {
        Name = var.instance-name
    }
}

