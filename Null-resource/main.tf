provider "aws" {
    region = "ap-south-1"
}

data "aws_instance" "data-ec2" {
    instance_tags = {
      Name = "test"
    } 
}

resource "null_resource" "terraform-ec2" {
    
    connection{
    type = "ssh"
    user = "ec2-user"
    host = data.aws_instance.data-ec2.public_ip
    private_key = file("./terraform.pem")
  }

provisioner "file" {
  source = "./inline.sh"
  destination = "/home/ec2-user/inline.sh"
}

provisioner "remote-exec" {
    inline = [ 
        "sh /home/ec2-user/inline.sh",
        "touch /home/ec2-user/inline-copy-test.txt"
     ]
  
}
  
}