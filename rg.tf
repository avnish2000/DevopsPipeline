variable "client_secret" {
}

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "78fe0fbb-e71d-41b6-999e-a6f08a7ba0a2"
  client_id       = "ba71423a-8bb8-4a7d-89d2-f309e826cac4"
  client_secret   = "kf-8Q~JjcPC62vh43aHafmpHw0Tmd~1kI5y6raWd"
  tenant_id       = "25f5130a-4bf4-4f76-9f3b-8b840a7ee452"
}

resource "azurerm_resource_group" "example" {
  name     = "terraformRG"
  location = "West US"

}


resource "azurerm_virtual_network" "vnet" {
  name                = "example-network"
  location            = azurerm_resource_group.terraVM.location
  resource_group_name = azurerm_resource_group.terraVM.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "Production"
  }
}
