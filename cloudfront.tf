module "cloudfront" {
  source              = "terraform-aws-modules/cloudfront/aws"
  version             = "2.2.0"
  price_class         = "PriceClass_100"
  wait_for_deployment = false

  origin = { s3 = {
    origin_id   = "s3"
    domain_name = module.s3_bucket.s3_bucket_bucket_regional_domain_name

    custom_header = [{
      name  = "Referer"
      value = random_string.cloudfront_referer.result
    }]
  } }

  default_cache_behavior = {
    target_origin_id       = "s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    default_ttl            = 0
    min_ttl                = 0
    max_ttl                = 0
    compress               = true
  }
}
