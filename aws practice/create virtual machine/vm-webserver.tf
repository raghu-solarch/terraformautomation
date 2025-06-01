resource "aws_instance" "webserver" {
  ami                    = "ami-03250b0e01c28d196"
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = aws_security_group.securitygroup.ids
  tags = {
    Name = "webserver"
  }
  key_name  = "raghu_kp_ppk"  
  user_data = <<EOF
#!/bin/bash -xe
apt update -y
apt install apache2 -y
service apache2 restart
echo "Hello world" > /var/www/html/index.html
EOF
}