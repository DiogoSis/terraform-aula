terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dl-terraform-state"
    storage_account_name = "azurestorageaula"
    container_name       = "remote-state"
    key                  = "depends-on/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# o depends-on foi adicionado para o que o bloco de modulo dependa o resource group
# aqui ele só vai criar os recursos do modulo, depois que o resource group estiver pronto
module "network" {
  depends_on = [
    azurerm_resource_group.resource_group
  ]
  source  = "Azure/network/azurerm"
  version = "5.3.0"

  resource_group_name     = azurerm_resource_group.resource_group.name
  use_for_each            = true
  resource_group_location = var.location
  subnet_names            = ["subnet-${var.environment}"]
  tags                    = local.common_tags
  vnet_name               = "vnet-${var.environment}"
}
