# Get List of Availability Zones in a Specific Region

data "aws_availability_zones" "my_azones" {
    filter {
      name = "opt-in-status"
      values = ["opt-in-not-required"]
    }
}

# Get the List of Availability Zones where respectice Instance Type is Supported

data "aws_ec2_instance_type_offerings" "my_ins_type" {
  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
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

