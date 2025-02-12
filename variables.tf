variable "aws_region" {
  description = "The region in which the resources will be created."
  type        = string
  default     = "eu-west-1"
}

variable "aws_profile" {
  description = "The AWS profile to use"
  type        = string
  default     = "amalitech-lab"
}

variable "bucket_name" {
  description = "s3 bucket name"
  type = string
  default = "princes3labbucket"
}

variable "tag" {
  type = string
  default = "StaticWebsiteBucket"
}