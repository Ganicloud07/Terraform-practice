# variable "create_ec2" {
#   type    = bool
#   default = true
# }

# resource "aws_instance" "app" {
#   count         = var.create_ec2 ? 1 : 0
#   ami           = "ami-0ced6a024bb18ff2e"
#   instance_type = "t3.micro"
# }




# variable "env" {
#   type    = string
#   default = "dev"
# }

# resource "aws_instance" "prod-server" {
#   count         = var.env == "prod" ? 1 : 0                         # Case 1: Default (env = "dev")   
#   ami           = "ami-0ced6a024bb18ff2e"                           # Condition: var.env == "prod" ❌ false    # count = 0                                                           # count = 0
#   instance_type = "t3.micro"                                        #Case 2: Jab env = "prod"

#   tags = {
#     Name = "prod-server"
#   }
# }



variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}


resource "aws_subnet" "public" {
  count = length(var.azs)
  vpc_id = "vpc-0ff2cf96ee39f19f0"
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = var.azs[count.index]

  tags = {
    Name = "public-${count.index}"
  }
}