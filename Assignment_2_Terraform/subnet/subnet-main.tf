# data "azurerm_resource_group" "rg01" {
#     name = var.rg_name
# }

resource "azurerm_resource_group" "azurermResourceGroup" {
  name     = var.rg_name
  location = "East US"
}

resource "azurerm_subnet" "example" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.azurermResourceGroup.name
    virtual_network_name = var.vnet_name
    address_prefixes = [var.subnet_CIDR]
  
}

output "sub_id" {
  value = azurerm_subnet.example.id
}