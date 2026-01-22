#Example-1

# variable "env" {
#   type = string
# }

# resource "aws_instance" "example" {
#   ami = "ami-0ced6a024bb18ff2e"

#   instance_type = var.env == "prod" ? "t3.large" : "t3.micro"
# }


#option-1, terraform plan -var="env=prod"  or  -var="env=dev,test"

#option-2, create terraform.tfvars give value here "evn=prod,test,dev"



#Example-2

variable "create_ec2" {
  type    = bool
  default = false
}

resource "aws_instance" "optional" {
  count = var.create_ec2 ? 1 : 0

  ami           = "ami-0ced6a024bb18ff2e"
  instance_type = "t3.micro"
}


# terraform plan  -var="create_ec2=true"  1 to add
# terraform plan  -var="create_ec2=false"  no changes