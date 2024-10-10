variable "cidr_vpc" {
  description = "Cidr para VPC criada na AWS"
  type        = string
}

variable "cidr_subnet" {
  description = "Cidr para subnet criada na AWS"
  type        = string
}

variable "environment" {
  description = "Ambiente a que pertencem os recursos criados"
  type        = string
}