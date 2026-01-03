resource "aws_instance" "name" {
    ami = "ami-00ca570c1b6d79f36"
    instance_type = "t3.small"

    tags = {
      Name  = "dev"
    }
  
}
resource "aws_s3_bucket" "name" {
    bucket = "gani-07"
  
}
