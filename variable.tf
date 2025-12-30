variable "ami_id" {

    description = "passing values to main.tf"
    type = string
    default = ""
  
}


variable "region" {
  
  type = string
  default = "ap-south-1"
}


variable "instance_type" {
    type = string
    default = ""
}
