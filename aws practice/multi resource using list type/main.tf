provider "aws" {
  region = var.region
}

resource "aws_vpc" "prod_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet)
  vpc_id                 = aws_vpc.prod_vpc.id
  cidr_block             = element(var.public_subnet, count.index)
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Public-Subnet-${count.index + 1}"
    Tier = "Public"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = element(var.private_subnet, count.index)
  
  tags = {
    Name = "Private-Subnet-${count.index + 1}"
    Tier = "Private"
  }
}
