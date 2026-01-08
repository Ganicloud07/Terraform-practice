variable "bucket" {
  type        = string
  description = "S3 bucket name"
  default = "gani-07"
}

variable "versioning" {
  type        = bool
  description = "Enable versioning"
  default = true
}

variable "control_object_ownership" {
  type        = bool
  description = "Enable object ownership control"
  default = false
}

variable "object_ownership" {
  type        = string
  description = "S3 object ownership setting"
  default = ""
}
