module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket

  control_object_ownership = var.control_object_ownership
  object_ownership         = var.object_ownership

  versioning = {
    enabled = var.versioning
  }
}
