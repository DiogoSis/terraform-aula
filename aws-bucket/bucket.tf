resource "aws_s3_bucket" "bucket" {
  bucket = "miguel-terraform-210724"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
