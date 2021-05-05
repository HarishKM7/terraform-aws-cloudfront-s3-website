output "website_url" {
  value = "https://${module.cloudfront.cloudfront_distribution_domain_name}/"
}

output "bucket_name" {
  value = module.s3_bucket.s3_bucket_id
}
