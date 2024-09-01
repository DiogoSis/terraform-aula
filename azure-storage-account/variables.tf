variable "location" {
  description = "Região dos Recursos"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" {
  description = "Tier da Storage Account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação de dados da Storage Account"
  type        = string
  default     = "LRS"
}

variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
  default     = "rg-terraform-azure"
}

variable "storage_account_name" {
  description = "Nome da Storage Account"
  type        = string
  default     = "lunaterraform"
}

variable "container_name" {
  description = "Nome do container"
  type        = string
  default     = "container-terraform"
}