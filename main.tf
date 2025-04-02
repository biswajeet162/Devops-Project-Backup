provider "azurerm" {
	features{}
}

resource "azurerm_resource_group" "biswa_example" {
	name = "biswajeet-rg"
	location = "East US"
}