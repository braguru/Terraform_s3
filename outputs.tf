output "website_endpoint" {
    value = aws_s3_bucket.static_site.bucket_domain_name
}