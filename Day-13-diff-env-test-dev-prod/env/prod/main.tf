provider "aws" {
  region = "ap-south-1"

}

module "S3" {
  source = "../../modules/s3"
  aws_s3_bucket= var.bucket
  versioning = var.versioning

  tags = {
    Name = var.bucket
    Envirnoment = "prod"
  }
}
