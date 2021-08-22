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

# AWS EC2 Instance Type - List 
 
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = [ "t2.micro", "t3.micro", "t3.small" ]
}

# AWS EC2 Instance Type - Map

variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t3.micro"
    "prod" = "t3.small"
  }
}

