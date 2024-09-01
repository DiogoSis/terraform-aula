resource "aws_s3_bucket" "bucket_aws" {
  bucket = "aula-terraform-aws-azure"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket_aws.id
  versioning_configuration {
    status = "Enabled"
  }
}