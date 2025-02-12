provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name

  tags = {
    Name = var.tag
  }
}

resource "aws_s3_bucket_public_access_block" "static_site" {
  bucket                  = var.bucket_name
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  bucket       = var.bucket_name
  key          = "index.html"
  source       = "${path.module}/index.html"
  content_type = "text/html"
  depends_on   = [aws_s3_bucket.static_site]
}

resource "aws_s3_object" "error" {
  bucket       = var.bucket_name
  key          = "error.html"
  source       = "${path.module}/error.html"
  content_type = "text/html"
  depends_on   = [aws_s3_bucket.static_site]
}

resource "aws_s3_bucket_website_configuration" "site_configuration" {
  bucket = var.bucket_name
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.static_site.id
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": [ "s3:GetObject"],
        "Resource": [
          "${aws_s3_bucket.static_site.arn}/*"
        ]
      }
    ]
  }
  EOF
}

