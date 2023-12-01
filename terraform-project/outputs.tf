output "instance_id" {
  value = aws_instance.terraform-ec2.id
}

output "instance_publicIP" {
  value = aws_instance.terraform-ec2.public_ip
}