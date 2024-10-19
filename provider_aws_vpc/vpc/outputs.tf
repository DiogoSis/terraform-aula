output "vpc_id_default" {
  description = "Id da VPC criada na AWS EUA"
  value       = aws_vpc.default.id
}

output "vpc_id_provider_1" {
  description = "Id da VPC criada na AWS Brasil"
  value       = aws_vpc.provider_1.id
}

output "vpc_id_provider_2" {
  description = "Id da VPC criada na AWS Europa"
  value       = aws_vpc.provider_2.id
}
