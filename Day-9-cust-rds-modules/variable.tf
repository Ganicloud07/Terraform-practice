variable "vpc_cidr" {
 type = string
 default = "10.0.0.0/16"
}

variable "vpc_name" {
    type = string
    default = "cust_vpc"
}

variable "subnet_a_name" {
  type = string
  default = "private_subnet_a"
}

variable "subnet_b_name" {
  type = string
  default = "private_subnet_b"
}

variable "az_a" {
  type = string
  default = "ap-south-1a"
}

variable "az_b" {
  type = string
  default = "ap-south-1b"
}

variable "aws_db_subnet_group" {
  type = string
  default = "db_subnet_group"
}

variable "subnet_a_cidr" {
    type = string
    default = "10.0.0.0/24"
  
}

variable "subnet_b_cidr" {
    type = string
    default = "10.0.1.0/24"
  
}

variable "db_subnet_group_name" {
  type = string
  default = "value"
}

variable "db_name" {
  type = string
  default = "database_name"
}

variable "identifier" {
    type = string
    default = "rds-dev"
  
}

variable "username" {
    type = string
    default = "admin"
  
}
variable "allocated_storage" {
    type = string
    default = "20"
  
}
variable "instance_class" {
  type = string
  default = "db.t4g.micro"
}

variable "password" {
    type = string
    default = "9554017568"
  
}