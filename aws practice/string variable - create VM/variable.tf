variable "aws_region" {
  default     = "eu-central-1" #AWS region
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16" # CIDR block for VPC
}

variable "public-subnet_cidr" {
  default     = "10.0.1.0/24" # CIDR block for public subnet
}

variable "private-subnet_cidr" {
  default     = "10.0.2.0/24" # CIDR block for public subnet
}

variable "key_pair_name" {
  default        = "raghu_kp_ppk" # Name of existing AWS key pair
}

variable "instance_type" {
  default     = "t2.micro" # EC2 instance type
}

variable "ami_id" {
  default        = "ami-03250b0e01c28d196" # AMI ID for EC2 instance
}