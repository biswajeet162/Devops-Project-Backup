# # for terraform backend state rg
# resource "azurerm_resource_group" "rg-state" {
#   name     = "rg-terraform"
#   location = "East US"
# }

# resource "azurerm_storage_account" "azurermStorageAccount" {
#   name                     = "biswastorageaccount1"
#   resource_group_name      = azurerm_resource_group.rg-state.name
#   location                 = azurerm_resource_group.rg-state.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "azurermStorageContainer" {
#   name                  = "tfstate"
#   storage_account_name  = azurerm_storage_account.azurermStorageAccount.name
#   container_access_type = "private"
# }

# # terraform {
# #   backend "azurerm" {
# #     resource_group_name   = "rg-state-terraform"
# #     storage_account_name  = "biswastorageaccount1"
# #     container_name        = "tfstate"
# #     key                   = "terraform.tfstate"
# #   }
# # }


# # terraform {
# #   backend "azurerm" {
# #     resource_group_name   = "rg-terraform"
# #     storage_account_name  = "tfstateaccount"
# #     container_name        = "tfstate"
# #     key                   = "aks-cluster.tfstate"
# #   }
# # }

