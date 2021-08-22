# Terraform Output Variables

# EC2 Instance Public IP with TOSET

output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = toset([for instance in aws_instance.myec2vm: instance.public_ip])
}

# EC2 Instance Public DNS with TOSET

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
}

# EC2 Instance Public DNS with TOMAP

output "instance_publicdns2" {
  description = "EC2 Instance Public DNS"
  value = tomap({for az, instance in aws_instance.myec2vm: az => instance.public_dns})
}

# Output Availabity Zones with Instance Types
output "output_1" {
  value = {for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
      az => details.instance_types}
}

# Filter Availability Zones with Supported Instance Types
output "output_2" {
  value = {for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
      az => details.instance_types if length(details.instance_types) != 0}
}

# Filter Availability Zones which have t2-micro instance type
output "output_3" {
  value = keys({for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
      az => details.instance_types if length(details.instance_types) != 0})
}
