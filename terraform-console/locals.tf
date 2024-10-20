locals {
  common_tags = {
    owner      = "luna-dev"
    managed-by = "terraform"
    location   = var.location
  }
}