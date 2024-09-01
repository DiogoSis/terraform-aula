variable "azure_location" {
  description = "Regiao da azure"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" {
  description = "Tier da Storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação de dados"
  type        = string
  default     = "LRS"
}

variable "aws_location" {
  description = "Região da aws"
  type        = string
  default     = "us-east-1"
}