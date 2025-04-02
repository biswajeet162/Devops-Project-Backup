provider "azurerm" {
  features {}
}

# resource "azurerm_resource_group" "azurermResourceGroup-assignment-2" {
#   name     = "biswa-rg-for-assignment-2"
#   location = "East US"
# }


resource "azurerm_resource_group" "azurermResourceGroup" {
  name     = "biswa-rg-for-remote-state-file"
  location = "East US"
}

resource "azurerm_storage_account" "azurermStorageAccount" {
  name                     = "biswastorageaccount1"
  resource_group_name      = azurerm_resource_group.azurermResourceGroup.name
  location                 = azurerm_resource_group.azurermResourceGroup.location
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
    resource_group_name   = "biswa-rg-for-remote-state-file"
    storage_account_name  = "biswastorageaccount1"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}




