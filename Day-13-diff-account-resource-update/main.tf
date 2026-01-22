resource "aws_s3_bucket" "name" {
  bucket = "gani-07"
  region = "ap-south-1"
}



resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    provider = aws.test
    tags = {
      Name = "my_vpc"
    }
  
}