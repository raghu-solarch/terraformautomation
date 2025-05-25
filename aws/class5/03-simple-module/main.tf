provider "aws" {
	region = var.aws_region
}

module "my_instance_module" {
        source = "./my_modules/instance"
        ami = "ami-0953476d60561c955"
        instance_type = "t2.micro"
        instance_name = "myvm01"
}  


module "my_instance_module2" {
        source = "./my_modules/instance"
        ami = "ami-0953476d60561c955"
        instance_type = "t2.micro"
        instance_name = "myvm02"
}  

module "my_instance_module3" {
        source = "./my_modules/instance"
        ami = "ami-0953476d60561c955"
        instance_type = "t2.micro"
        instance_name = "myvm03"
} 