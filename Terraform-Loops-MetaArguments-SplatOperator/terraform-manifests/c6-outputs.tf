# Terraform Output Variables

# Output - For Loop with list
output "for_output_list" {
  description = "For Loop with list"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

#  Output -  For Loop with map
output "for_loop_map" {
  description = "For loop with map"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

# Output - For Loop with Map Advanced
output "for_loop_map2" {
  description = "For loop with advanced map"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}

# Output - Splat Operator
output "splat_operator" {
  description = "Generalized latest splat operator"
  value = aws_instance.myec2vm[*].public_dns
}