provider "azurerm" {
  features  {}
}

module "azure_aks" {
  source = "./aks-module"

  tags = {
    environment  = "dev"
    project = "terraform-aks" 
  }

  resource_group_name = "biswa-aks-rg-1"

  dns_prefix = "biswacluster"
  admin_username = "azureuser"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+68+lReqL0rGvWrIildz9EhNxKuxeTnVSIIV8dajk+qEvMjU4BvFcmBeUYktjDMunduHQrxL836YPz1dxixxUQxONtdvxBq1L9og9Jm6h+PAWtdcfqvO9/gX1F2jB8ZwyB1sesNc1+RJXoj67+GBHyivh3Wex06ZJBDll4x7aJ7OTg7DezOCBDIIUTMAVZRJpBYBuJEhIAuQIUA7UXNVUPq70dZveHLpeAwQcPMv/QXBbFDGn8wE6DcQGvL5biHCIpw2Iz3JauoCVtcu3bx+5M1BJ7rdf2MqWrKH+q2DWAybvLCPx6cysfjgpoIYQ8YmVmdShmyiNS+jZisj1HIgUlVqrrT9E6yPEvTULxSLqPwz2eZ4jS7txlgaorQDyXryAUMRkXAH8bMEPeuQzxceVMamllTZF/tsraXKrj5Q3BPVL1JafdA4lsJiy2v1GlvxjF/b+zEkUgmhpzQ983SjcXThDcBHyT9lEMMtinbuBGCOYL7nxDzOajPolzaqjvqE= visha@Vishal"

  node_count = 3
  vm_size = "Standard_D2s_v3"
  os_disk_size_gb = 30
  aks_cluster_name = "demoAKSbiswa"

}




