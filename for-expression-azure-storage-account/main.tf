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
    key                  = "for-expression/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}