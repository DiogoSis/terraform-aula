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
    key                  = "azure-vm-modulos-remotos/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "5.3.0"

  resource_group_name = resouce_group.resouce_group.name
  use_for_each        = true
  resource_group_location = var.location
  subnet_names        = ["subnet - ${var.environment}"]
  tags                = local.common_tags
  vnet_name           = "vnet - ${var.environment}"
}
