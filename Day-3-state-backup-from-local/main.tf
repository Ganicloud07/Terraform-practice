resource "aws_instance" "name" {
  ami = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro"

  tags = {
    Name = "Gani"
  }
}

/*resource "aws_s3_bucket" "test" {
  bucket = "nothigfdhjcveuhskksabjk"


}
  
resource "aws_s3_bucket_versioning" "test" {
  bucket = aws_s3_bucket.test.id
  versioning_configuration {
    status = "Enabled"
  }
}*/
