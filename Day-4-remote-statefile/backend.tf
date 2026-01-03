terraform {
  backend "s3" {
    bucket = "gani-07"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
