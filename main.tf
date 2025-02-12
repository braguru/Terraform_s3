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


resource "aws_s3_bucket_website_configuration" "site_configuration"{
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
    policy = jsonencode({
        Version = "2012-10-17", 
        Statement = [ 
            {
            Sid = "PublicReadGetObject", 
            Effect = "Allow", Principal = "*",
            Action = ["s3:GetObject"], 
            Resource = ["${aws_s3_bucket.static_site.arn}/*"] 
            } 
        ] 
    })
}

