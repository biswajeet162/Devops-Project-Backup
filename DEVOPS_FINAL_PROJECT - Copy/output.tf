output "kube_config" {
  value = module.azure_aks.kube_config
  sensitive = true
}