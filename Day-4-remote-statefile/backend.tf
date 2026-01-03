terraform {
  backend "s3" {
    bucket = "gani-07"
    key    = "terraform.tfstate"
    region = "ap-south-1"

    # Enable S3 native locking
    use_lockfile = true 
    # The dynamodb_table argument is no longer needed
    
  }

}
