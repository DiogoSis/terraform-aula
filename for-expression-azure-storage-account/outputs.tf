#Utilização de tupla para cada storage
output "storage_account_id" {
  description = "ID do storage account criado na azure"
  value       = [ for sa in azurerm_storage_account.storage_account : sa.id ]
}

#Utilização de objeto para cada acess_key
output "sa_prymary_acess_key" {
  description = "Primary access key da Storage account criadas da Azure"
  value       = { for key, sa in azurerm_storage_account.storage_account : key => sa.primary_access_key }
  sensitive   = true
}

