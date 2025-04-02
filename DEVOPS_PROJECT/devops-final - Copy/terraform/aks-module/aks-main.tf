data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
  }


resource "azurerm_public_ip_prefix" "example" {
  name                = "myPublicIPPrefix"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  prefix_length       = 28  # Number of public IPs in the prefix

  tags = var.tags
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  
  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size             = var.vm_size
    os_disk_size_gb     = var.os_disk_size_gb

    # Enable public IPs for nodes
    # node_public_ip_enabled = true
    # # Optional: specify a public IP prefix if needed
    # node_public_ip_prefix_id = azurerm_public_ip_prefix.example.id
  }

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = var.ssh_public_key 
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  role_based_access_control_enabled = true
  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = "nodepool1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.vm_size
  node_count            = var.node_count
  os_disk_size_gb       = var.os_disk_size_gb
  mode                  = "User"

  # Enable public IPs for nodes
  enable_node_public_ip = true

  tags = var.tags
}






  
# resource "azurerm_kubernetes_cluster" "aks" {
#   name                = var.aks_cluster_name
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   dns_prefix          = var.dns_prefix
  
#   default_node_pool {
#     name       = "default"
#     node_count = var.node_count
#     vm_size    = var.vm_size
#     os_disk_size_gb = var.os_disk_size_gb
#   }

#   linux_profile {
#     admin_username = var.admin_username
#     ssh_key {
#       key_data = var.ssh_public_key 
#     }
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   network_profile {
#     network_plugin = "azure"
#     network_policy = "calico"
#   }


# role_based_access_control_enabled = true
# tags = var.tags
# }


