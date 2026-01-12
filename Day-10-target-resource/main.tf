resource "aws_instance" "name" {
    ami = "ami-0ced6a024bb18ff2e"
    instance_type = "t3.small"

    tags = {
        Name = "test"
    }
  
}


resource "aws_s3_bucket" "gani" {
  bucket = "gani-08"
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.gani.id

  versioning_configuration {
    status = "Enabled"
  }
}


# terraform plan -target=aws_s3_bucket.gani 
# terraform apply -auto-approve -target=aws_s3_bucket.gani
