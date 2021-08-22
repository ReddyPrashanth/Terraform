# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amznlinux2.id
  instance_type = var.instance_type_map["dev"]
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.ec2-ssh.id, aws_security_group.ec2-web.id]
  user_data = file("${path.module}/app1-install.sh")
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key
  tags = {
    "Name" = "EC2-For-Each-Demo-${each.key}"
  }
}