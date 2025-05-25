###############################################################################
# Terraform ≥ 1.5 + AWS provider ≥ 5.0
###############################################################################

locals {
  env = "dev1"

  buckets = {
    my_test_bucket1 = {
      name = "mytest-cbc-12345"
      tags = {
        Name        = "mytest-cbc-12345"
        Environment = local.env
      }
    }
    my_test_bucket2 = {
      name = "mytest-cbc-123452023"
      tags = {
        Name        = "mytest-cbc-123452023"
        Mail        = "careerbytec@gmail.com"
        Environment = local.env
      }
    }
  }
}

resource "aws_s3_bucket" "this" {
  for_each = local.buckets

  bucket = each.value.name
  tags   = each.value.tags
}

resource "aws_s3_bucket_ownership_controls" "this" {
  for_each = aws_s3_bucket.this

  bucket = each.value.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# OPTIONAL: You can enable this if you want to allow some public access
# resource "aws_s3_bucket_public_access_block" "this" {
#   for_each = aws_s3_bucket.this
#   bucket                  = each.value.id
#   block_public_acls       = false
#   ignore_public_acls      = false
#   block_public_policy     = false
#   restrict_public_buckets = false
# }
