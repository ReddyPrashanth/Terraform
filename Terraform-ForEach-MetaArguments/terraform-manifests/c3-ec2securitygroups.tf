# Create Security Group - SSH Traffic
resource "aws_security_group" "ec2-ssh" {
  name = "ec2-ssh"
  description = "Dev EC2 SSH"

  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow port 22"
    protocol = "tcp"
    from_port = 22
    to_port = 22
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    protocol = "tcp"
    security_groups = null
    self = null
  } ]

  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow all ip and ports outbound"
    protocol = "-1"
    from_port = 0
    to_port = 0
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    security_groups = null
    self = null
  } ]

  tags = {
    "Name" = "ec2-ssh"
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "ec2-web" {
  name = "ec2-web"
  description = "Dev EC2 Web"

  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow port 80"
    from_port = 80
    to_port = 80
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    protocol = "tcp"
    security_groups = null
    self = null
  },{
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow port 443"
    from_port = 443
    to_port = 443
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    protocol = "tcp"
    security_groups = null
    self = null
  } ]

  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow all ip and ports outbound"
    protocol = "-1"
    from_port = 0
    to_port = 0
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    security_groups = null
    self = null
  } ]

  tags = {
    "Name" = "ec2-web"
  }
}