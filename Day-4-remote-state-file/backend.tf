terraform {
  backend "s3" {
    bucket = "gani-07"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}