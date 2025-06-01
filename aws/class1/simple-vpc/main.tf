resource "aws_vpc" "dev_amex" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-amex"
  }
}

resource "aws_subnet" "dev_amex_pub_sub1" {
  vpc_id = aws_vpc.dev_amex.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dev-amex-pub-sub1"
  }
}
