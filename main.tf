provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-2fd69c73-hands-on-with-terraform-on-azure"
  location = "East US"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "anilkrmv"

    workspaces {
      name = "Hands-On_with_Terraform_on_Azure"
    }
  }
}

module "securestorage" {
  source               = "app.terraform.io/anilkrmv/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "anilkrmvoragelab12ee3"
}
