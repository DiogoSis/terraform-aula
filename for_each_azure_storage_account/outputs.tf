output "storage_account_brasil_id" {
  description = "ID do storage account criado na azure"
  value       = azurerm_storage_account.storage_account["brasil"].id
}

output "storage_account_eua_id" {
  description = "ID do storage account criado na azure"
  value       = azurerm_storage_account.storage_account["eua"].id
}

output "storage_account_europa_id" {
  description = "ID do storage account criado na azure"
  value       = azurerm_storage_account.storage_account["europa"].id
}

output "storage_account_asia_id" {
  description = "ID do storage account criado na azure"
  value       = azurerm_storage_account.storage_account["asia"].id
}

output "sa_prymary_acess_brasil_key" {
  description = "Primary access key da Storage account"
  value       = azurerm_storage_account.storage_account["brasil"].primary_access_key
  sensitive   = true
}

output "sa_prymary_acess_eua_key" {
  description = "Primary access key da Storage account"
  value       = azurerm_storage_account.storage_account["eua"].primary_access_key
  sensitive   = true
}

output "sa_prymary_acess_europa_key" {
  description = "Primary access key da Storage account"
  value       = azurerm_storage_account.storage_account["europa"].primary_access_key
  sensitive   = true
}

output "sa_prymary_acess_asia_key" {
  description = "Primary access key da Storage account"
  value       = azurerm_storage_account.storage_account["asia"].primary_access_key
  sensitive   = true
}