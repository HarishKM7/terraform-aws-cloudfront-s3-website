module "s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "2.1.0"
  acl           = "public-read"
  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy.json
  force_destroy = true
  website       = { index_document = "index.html" }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}
