resource "aws_s3_bucket" "bucket" {
  bucket = "diogo-lifecyrcle"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
