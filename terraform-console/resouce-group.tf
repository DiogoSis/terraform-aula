resource "azurerm_resource_group" "resource_group" {
  name     = "dl-console"
  location = var.location

  tags = local.common_tags
}

