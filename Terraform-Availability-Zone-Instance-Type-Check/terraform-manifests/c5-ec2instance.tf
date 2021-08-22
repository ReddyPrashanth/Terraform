
# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amznlinux2.id
  instance_type = var.instance_type_map["dev"]
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.ec2-ssh.id, aws_security_group.ec2-web.id]
  user_data = file("${path.module}/app1-install.sh")
  for_each = toset(keys({for az, details in data.aws_ec2_instance_type_offerings.my_ins_type:
    az => details.instance_types if length(details.instance_types) != 0}))
  availability_zone = each.key
  tags = {
    "Name" = "EC2-For-Each-Demo-${each.key}"
  }
}