# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amznlinux2.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.ec2-ssh.id, aws_security_group.ec2-web.id]
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Demo 2"
  }
}