locals {
  env  = "dev"
  name = "gani-server"
}

resource "aws_instance" "example" {
  ami           = "ami-0abc123"
  instance_type = "t3.micro"

  tags = {
    Name = "${local.name}-${local.env}"
  }
}
