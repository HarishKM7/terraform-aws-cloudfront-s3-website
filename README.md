# S3 Website + CloudFront

This opinionated Terraform module creates a private S3 bucket configured for static website hosting and a CloudFront distribution for it.

* Bucket is NOT public. ONLY CloudFront is allowed access to it using a Referer header. Details [here](https://aws.amazon.com/premiumsupport/knowledge-center/cloudfront-serve-static-website/#Using_a_website_endpoint_as_the_origin.2C_with_access_restricted_by_a_Referer_header).
* Bucket name is auto-generated and outputted.
* SSE-S3 encryption is enabled by default.
* Bucket must contain index.html.
* CloudFront caching is disabled.
* CloudFront is only deployed to US, Canada, and Europe.
* CloudFront custom domain is not supported. Distribution URL is outputted.
