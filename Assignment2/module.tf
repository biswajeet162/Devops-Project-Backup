provider "azurerm" {
  features {
    
  }
}

module "biswa-module" {
  source = "./subnet"
  rg_name = "biswa-rg-2"

   vnet_name = "example-network-12345"
  vnet_address_space = "10.0.0.0/16"

  subnet_name = "sub12345"
  subnet_CIDR = "10.0.1.0/24"
 
}

#SETTING STATEFILE TO THE REMOTE

data "azurerm_resource_group" "azurermResourceGroup" {
    name = "biswa-rg-2" // existing rg
}

resource "azurerm_storage_account" "azurermStorageAccount" {
  name                     = "biswastorageaccount12345"
  resource_group_name      =  data.azurerm_resource_group.azurermResourceGroup.name
  location                 = data.azurerm_resource_group.azurermResourceGroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "azurermStorageContainer" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.azurermStorageAccount.name
  container_access_type = "private"
}

terraform {
  backend "azurerm" {
    resource_group_name   = "biswa-rg-2"
    storage_account_name  = "biswastorageaccount12345"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}