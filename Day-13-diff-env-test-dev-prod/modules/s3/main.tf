resource "aws_s3_bucket" "bucket" {
  bucket = var.aws_s3_bucket

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

   versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}