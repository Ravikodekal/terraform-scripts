resource "aws_instance" "terraform-ec2" {
	ami = var.ami
	instance_type = var.instance-type
	key_name = var.key-name
    subnet_id = var.subnet-id

	tags = {
		Name = var.instance-name
	}
}