provider "azurerm" {
	features{}
}

resource "azurerm_resource_group" "biswa-exapmle" {
	name = "biswa-rg"
	location = "East US"
}