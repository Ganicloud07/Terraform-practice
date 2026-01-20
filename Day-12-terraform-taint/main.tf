provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "ec2" {
  ami           = "ami-0ced6a024bb18ff2e"
  instance_type = "t3.micro"

  tags = {
    Name = "server"
  }
}






#Use terraform taint to manually mark the resource for recreation:
# terraform taint aws_instance.server
# terraform apply