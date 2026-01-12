resource "aws_instance" "example" {
    ami = "ami-0ced6a024bb18ff2e"
    instance_type = "t3.micro"

    tags = {
        Name = "prod"
    }
  
}


resource "aws_s3_bucket" "gani" {
  bucket = "gani-07"
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.gani.id

  versioning_configuration {
    status = "Enabled"
  }
}





#terraform import aws_instance.example i-00f637fbca178cf70
#terraform import aws_s3_bucket.gani "gani-07"
#terraform import aws_s3_bucket_versioning.name "gani-07"