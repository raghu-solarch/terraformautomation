
# provider block for aws cloud #
provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "main" {
  cidr_block       = "20.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}



resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "20.0.1.0/24"

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "20.0.2.0/24"

  tags = {
    Name = "Private"
  }
}


resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "20.0.3.0/24"

  tags = {
    Name = "public3"
  }
}