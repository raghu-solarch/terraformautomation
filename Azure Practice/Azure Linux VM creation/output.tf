# Output public IP
output "public_ip" {
  value = azurerm_public_ip.dev_public_ip.ip_address
}