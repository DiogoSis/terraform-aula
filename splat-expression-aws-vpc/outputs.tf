output "subnets_id" {
  description = "ID da Subnet criada na AWS"
  value       = aws_subnet.subnet[*].id
}