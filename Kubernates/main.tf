provider "azurerm" {
  features  {}
}



resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-cluster"
  location = "East US"
}



resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks"
  
  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "acrmyregistry"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
