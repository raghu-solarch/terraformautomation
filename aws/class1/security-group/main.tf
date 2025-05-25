provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "webserver_sg" {
  ingress {
    description = "port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["91.177.109.50/32"]
  }
  ingress {
    description = "port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["91.177.109.50/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}


resource "aws_instance" "careerbytecode" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
  key_name               = "careerbytecode"
  tags = {
    Name = "CareerByteCode All in One Technology Platform For IT Job Seekers"
  }

  user_data = <<EOF
#!/bin/bash
sudo amazon-linux-extras install epel -y
sudo /bin/yum install httpd -y
sudo /bin/systemctl restart httpd
sudo /bin/systemctl enable httpd
sudo su
sudo /bin/echo "Hello world " >/var/www/html/index.html
instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
sudo echo $instance_ip >>/var/www/html/index.html
ls
EOF

}

