provider "aws" {
  region = local.region
  
}
resource "aws_instance" "example" {
  ami   = local.ami
  instance_type = local.instance_type

tags = merge(
  local.comman_tags,
  {
    Name  = local.env
    ami = local.ami
  }

)
}
