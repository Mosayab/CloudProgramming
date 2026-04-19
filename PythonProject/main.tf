resource "aws_s3_bucket" "page" {
  bucket = var.s3bucket
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.page.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.page.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [
  aws_s3_bucket_ownership_controls.ownership,
  aws_s3_bucket_public_access_block.access]

  bucket = aws_s3_bucket.page.id
  acl = "public-read"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.page.id
  key    = "helloworld.html"
  source = "helloworld.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.page.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.page.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "configuration" {
  bucket = aws_s3_bucket.page.id

  index_document {
    suffix = "hello_world.html"
  }

  depends_on = [aws_s3_bucket_acl.acl]
}

output "url" {
  value = aws_s3_bucket_website_configuration.configuration.website_endpoint
}