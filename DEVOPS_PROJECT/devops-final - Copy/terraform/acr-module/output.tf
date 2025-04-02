# Output the login server URL
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

# Output the admin username
output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

# Output the admin password
output "acr_admin_password" {
  value = azurerm_container_registry.acr.admin_password
    sensitive = true
}