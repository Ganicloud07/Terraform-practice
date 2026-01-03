resource "aws_instance" "name" {

ami = "ami-00ca570c1b6d79f36"
instance_type = "t3.micro"

tags = {
  Name = "gani"
}

}
  resource "aws_s3_bucket" "my_bucket" {
  bucket = "gani-07" 
}
