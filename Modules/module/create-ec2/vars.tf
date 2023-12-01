variable "key-name" {
  description = "The Key to be used for the instance"
  type = string
}
variable "ami" {
  description = "The AMI to be used for the instance"
  type = string
}
variable "instance-type" {
  description = "The Instance type to be used for the instance"
  type = string
}

variable "instance-name" {
  description = "The name of the instance to create"
  type = string
}


variable "subnet-id" {
  description = "The name of the instance to create"
  type = string
}