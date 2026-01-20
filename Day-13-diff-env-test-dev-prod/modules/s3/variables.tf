variable "aws_s3_bucket" {
    type = string
     description = "Name of the S3 bucket"
  
}


variable "versioning" {
  description = "Enable versioning or not"
  type        = bool
  default     = false
}


variable "tags" {
  description = "Tags for S3 bucket"
  type        = map(string)
  default     = {}
}
