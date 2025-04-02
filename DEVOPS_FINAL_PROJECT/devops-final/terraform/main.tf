provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}


module "my-vms" {
  source = "./vm-module"

  rg_name = var.rg_name
  vm_count = 1
  location = var.location

  vnet_name = "my-vnet"
  vet_address_space = "10.0.0.0/16"

  subnet_name = "sub1"
  subnet_prefix = "10.0.1.0/24"

  vm_name_prefix = "biswa"

  admin_username = "azureuser"
  admin_password = "Pass@12345"

  path = "/home/azureuser/.ssh/authorized_keys"
  key_data = file("C:\\Users\\visha\\.ssh\\id_rsa.pub")

}

# module "azure_aks" {
#   source = "./aks-module"

#   tags = {
#     environment  = "dev"
#     project = "terraform-aks" 
#   }

#   resource_group_name = var.rg_name

#   dns_prefix = "biswacluster"
#   admin_username = "azureuser"
#   ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDrvRkTGFTHTx4EqoK6R0Q0etEDu/jo/3ZTMTZ/0GC/HrWvOcYB7Nd0ovqoxDVUSCG62dP5dfmBCylvm6MmiS8xVfYAArxPJ2rrWfmRsIpoM06wODO343Z2SA5d2FfXfHQX8U9lI1FhdAPr7F4RQCDTxdZbzkcLHkLK2EdFfDAxGibBWgXoAPSUSMwjijFixPbPdDXPbMHwI0q1giEExzzdHnEzdXcblSKaOUaIqnICTs7SmpxGhbPer5IDPQjABWkNYnNlBxTiHB2UfgCA1AIQYMy4zJQCiEWsI85tIR22aXXCOwScqEqFlYYaHrGJZnxS9aoWFmrs9HpLHDoNa0BA3LRq4iQVVRGt2aaEJlG/L9n/wbGJoWbVNR8QyRG3T4zCuVxYj1kSqFzPWrsGjpvJsBWC343iwvjJbHuqwlKT/dj2GHn+rsrpXGDwlrs50xxBChxGn90UuB7N2e9jLKoXT3S+T1dfY5eZDMZaHYb24TK+GaFlqwevbPTmEwLjZxE= visha@Vishal"
#   node_count = 3
#   vm_size = "Standard_D2s_v3"
#   os_disk_size_gb = 30
#   aks_cluster_name = "demoAKSbiswa"

# }

module "azure_acr" {
  source = "./acr-module"

  resource_group_name  = var.rg_name
  acr_name = "azurecontainerrg12234567"
}



















# # Define the Azure provider
# provider "azurerm" {
#   features {}
# }

# # Define resource group
# resource "azurerm_resource_group" "acr_rg" {
#   name     = "devops-final-rg"
#   location = "East US"
# }

# # Define Azure Container Registry
# resource "azurerm_container_registry" "acr" {
#   name                = "dockerimagecontainerreg"
#   resource_group_name = azurerm_resource_group.acr_rg.name
#   location            = azurerm_resource_group.acr_rg.location
#   sku                 = "Basic" # Options: Basic, Standard, Premium
#   #admin_enabled       = true # Enable admin user to simplify authentication

#   # Tags for resource management
#   tags = {
#     environment = "Development"
#   }
# }


