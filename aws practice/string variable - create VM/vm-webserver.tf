resource "aws_instance" "webserver" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = ["${aws_security_group.securitygroup.id}"]
  tags = {
    Name = "webserver"
  }
  key_name  = var.key_pair_name 
  user_data = <<EOF
#!/bin/bash -xe
apt update -y
apt install apache2 -y
service apache2 restart
echo "Hello world" > /var/www/html/index.html
EOF
}