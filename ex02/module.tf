provider "azurerm" {
  features {
    
  }
}

module "sub1" {
  source = "./subnet"
  rg_name = "my_rg_01"
  subnet_name = "sub1"
  subnet_CIDR = "10.0.1.0/24"
  vnet_name = "biswanetwork"
}