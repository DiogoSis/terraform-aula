output "vm_ip" {
  description = "IP da VM criada na Azure"
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.public_ip_address
}