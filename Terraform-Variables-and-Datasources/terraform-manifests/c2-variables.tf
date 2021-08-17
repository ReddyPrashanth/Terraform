# Input Variables
#Aws Region
variable "aws_region" {
  description = "AWS Region in which resources are created"
  type = string
  default = "us-east-2"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

# AWS EC2 Key Pair
variable "instance_keypair" {
  description = "EC2 key Pair that needed to be associated with EC2 Instance to SSH"
  type = string
  default = "ec2"
}