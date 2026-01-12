locals {
  ami = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro"
  region = "ap-south-1"
  env = "test"

  comman_tags = {
    environment = local.env
    owner = "Gani"
    region = local.region
    ami = local.instance_type
  }
}