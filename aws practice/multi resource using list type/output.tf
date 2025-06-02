output "private_subnet1" {
  value = aws_subnet.private_subnets.*.id
  
}


output "public_subnet1" {
  value = aws_subnet.public_subnets.*.id
  
}
