data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_bucket.s3_bucket_arn}/*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:Referer"
      values   = [random_string.cloudfront_referer.result]
    }
  }
}
