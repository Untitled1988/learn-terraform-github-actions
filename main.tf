provider "aws" {
  region = var.region
}

data "aws_security_groups" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

resource "aws_instance" "web" {
  ami = lookup(var.amis,var.region)
  instance_type = var.instance_type
  key_name = aws_key_pair.ssh.key_name
  user_data = templatefile("setup_nginx.sh", {time = timestamp()})
  tags = {
    Name = "nginx-web-server"
  }
}

resource "aws_key_pair" "ssh" {
  key_name   = "admin"
  public_key = file(var.public_key)
}

# 开放22端口
resource "aws_security_group_rule" "ssh" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = data.aws_security_groups.default.ids[0]
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}
# 开放80端口
resource "aws_security_group_rule" "web" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = data.aws_security_groups.default.ids[0]
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}
