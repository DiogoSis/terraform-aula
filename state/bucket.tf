resource "aws_s3_bucket" "bucket_1" {
  bucket = "aula-de-state"

  tags = {
    Name        = "tag_bucket 1"
    Environment = "Dev 1"
  }
}