variable "location" {
  description = "Região dos Recursos"
  type        = map(string)
  default = {
    "brasil" = "Brazil South",
    "eua"    = "East Us",
    "europa" = "West Europe",
    "asia"   = "Japan East"
  }
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