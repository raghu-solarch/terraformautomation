variable "region" {
  description = "AWS region"
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet" {
  type        = list(string)
  description = "List of CIDRs for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet" {
  type        = list(string)
  description = "List of CIDRs for private subnets"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
