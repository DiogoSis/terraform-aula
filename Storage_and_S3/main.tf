terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "aws" {
  region = var.aws_location

  default_tags {
    tags = local.common_tags
  }
}

provider "azurerm" {
  features {}
}