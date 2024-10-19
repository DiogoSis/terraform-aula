variable "location" {
  description = "Região dos Recursos"
  type        = string
  default     = "Brazil South"
}

variable "environment" {
  description = "Ambiente a que pertencem os recursos criados na Azure"
  type        = string
  default     = "desenvolvimento"
}