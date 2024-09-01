output "storage_account_id" {
  description = "ID do storage account criado na azure"
  value       = azurerm_storage_account.storage_account.id
}

output "sa_prymary_acess_key" {
  description = "Primary access key da Storage account"
  value       = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
}