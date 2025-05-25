variable "vpc_id" {}

data "aws_vpc" "selected" {
  id = var.vpc_id
}


output "vpc_project1" {
  value = data.aws_vpc.selected.id
  
}