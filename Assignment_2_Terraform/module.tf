## PROVIDER ALREADY PRESENT IN MAIN.TF <-------------------------------
# provider "azurerm" {
#   features {
    
#   }
# }

module "sub1" {
  source = "./subnet"
  rg_name = "biswa-rg-for-assignment-3"
  subnet_name = "sub1"
  subnet_CIDR = "10.0.1.0/24"
  vnet_name = "example-network"
}