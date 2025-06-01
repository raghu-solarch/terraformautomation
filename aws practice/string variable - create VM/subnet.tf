resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public-subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private-subnet_cidr

  tags = {
    Name = "Private-subnet"
  }
}