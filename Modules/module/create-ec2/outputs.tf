output "instance-id" {
  value = aws_instance.terraform-ec2.id
}

output "public-ip" {
  value = aws_instance.terraform-ec2.public_ip
}
output "private-ip" {
    value = aws_instance.terraform-ec2.private_ip
  
}