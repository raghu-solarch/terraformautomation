output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.main.public_ip_address
}

output "admin_password" {
  value     = azurerm_windows_virtual_machine.main.admin_password
}

output "computer_name" {
  value     = azurerm_windows_virtual_machine.main.computer_name
}
