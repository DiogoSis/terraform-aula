output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "secutity_group_id" {
  description = "ID da N.S.G criada na Azure"
  value       = azurerm_network_security_group.nsg.id
}