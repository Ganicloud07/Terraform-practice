provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "ec2" {
  ami           = "ami-0ced6a024bb18ff2e"
  instance_type = "t3.micro"
user_data = file("test.sh")
  tags = {
    Name = "server"
  }
}
