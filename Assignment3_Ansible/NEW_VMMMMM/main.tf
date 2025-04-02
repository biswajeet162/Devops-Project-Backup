provider "azurerm" {
  features {}
}

module "my-vms" {
  source = "./azure-vm-module"

  rg_name = "biswa-rg1-for-assignment-2"
  vm_count = 4
  location = "East US"

  vnet_name = "my-vnet"
  vet_address_space = "10.0.0.0/16"

  subnet_name = "sub1"
  subnet_prefix = "10.0.1.0/24"

  vm_name_prefix = "biswa"

  path = "/home/adminuser/.ssh/authorized_keys"
  key_data = file("C:\\Users\\visha\\.ssh\\id_rsa.pub")

}

# ssh-keygen
#ssh -i ~/C:\\Users\\visha\\.ssh\\id_rsa adminuser@ip