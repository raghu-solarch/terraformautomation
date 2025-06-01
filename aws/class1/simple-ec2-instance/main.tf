provider "aws" {
  region = "us-east-1"  # Update to your preferred AWS region
}

resource "aws_instance" "server1_app1" {
  ami                    = "ami-0953476d60561c955"
  instance_type          = "t2.micro"
  key_name               = "cbcpoc"  # Replace with your actual key pair name
  subnet_id              = "subnet-0a1c332339f95d083"  # Replace with your subnet ID
  vpc_security_group_ids = ["sg-0552081e06fd3efce"]    # Replace with your security group ID(s)
  
  associate_public_ip_address = true

  tags = {
    Name        = "server1-app1"
    Environment = "dev"
  }
}