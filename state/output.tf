output "bucket_id" {
  description = "Id da Bucket criado na AWS"
  value       = aws_s3_bucket.bucket_1.id
}
output "bucket_arn" {
  description = "ARN da Bucket criada"
  value       = aws_s3_bucket.bucket_1.arn
}
output "bucket_tags" {
  description = "Todas as Tags"
  value       = aws_s3_bucket.bucket_1.tags_all
}