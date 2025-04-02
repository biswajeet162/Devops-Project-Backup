#rource group
resource "azurerm_resource_group" "azurermResourceGroup" {
  name     = var.rg_name
  location = "East US"
}

#Virtual Network
resource "azurerm_virtual_network" "azurermvnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.azurermResourceGroup.location
  resource_group_name = azurerm_resource_group.azurermResourceGroup.name
  depends_on = [ azurerm_resource_group.azurermResourceGroup ]
}

#Subnet
resource "azurerm_subnet" "azurermsubnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.azurermResourceGroup.name
  virtual_network_name = azurerm_virtual_network.azurermvnet.name
  address_prefixes     = [var.subnet_CIDR]
  depends_on = [ azurerm_virtual_network.azurermvnet ]
}

output "sub_id" {
  value = azurerm_subnet.azurermsubnet.id
  depends_on = [ azurerm_resource_group.azurermResourceGroup ]
}