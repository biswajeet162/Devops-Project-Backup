variable "resource_group_name" {
  default = "aks-rg-biswa"
}
variable "location" {
  default = "East US"
}

variable "aks_cluster_name" {
  default = "aks-biswa-cluster"
}
 variable "dns_prefix" {
   default = "aks"
 }

variable "node_count" {
  default = 3
}

variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "os_disk_size_gb" {
  default = 30
}


variable "admin_username" {
  default = "azureuser"
}

variable "ssh_public_key" {
  default = "default"
}

variable "tags" {
  default = "tags : mytag"
}
