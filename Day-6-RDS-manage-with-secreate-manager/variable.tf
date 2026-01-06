variable "db_name" {
   type = string
   default = "database_name"
  
}
variable "identifier" {
  type = string
  default = "rds-test"
}
variable "username" {
    type = string
    default = "admin"
  
}

variable "instance_class" {
    type = string
    default = "db.t3.micro"
  
}
variable "allocated_storage" {
    type = string
    default = "20"
  
}

#----------------VPC variable---------------

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "subnet_a_cidr" {
  type = string
  default = "10.0.0.0/24"
}

variable "subnet_b_cidr" {
    type = string
    default = "10.0.1.0/24"
    
  
}
variable "az_a" {
    type = string
    default = "us-west-2a"
   
  
}

variable "az_b" {
    type = string
    default = "us-west-2b"

  
}
variable "subnet_a_name" {
  type = string
  default = "private_a"
}


variable "subnet_b_name" {
    type = string
  default = "private_b"
}


variable "db_subnet_group_name" {
  type = string
  default = "value"
}