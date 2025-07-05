# # resource "azurerm_storage_container" "blockcontainer" {
# #     for_each = var.container101
# #   name                  = each.value.name
# #   storage_account_id    = each.key.storage_account_ids[each.key]
# #   container_access_type = each.value.container_access_type
# # }


# # Create Storage Container
# resource "azurerm_storage_container" "blockcontainer" {
#   name                    = "tcscontainer"
#   storage_account_name     = azurerm_storage_account.tcsstgg.name
#   container_access_type   = "blob"
# }

# # Create Storage Blob
# resource "azurerm_storage_blob" "blockblob" {
#   name                      = "stgblob"
#   storage_account_name      = azurerm_storage_account.tcsstgg.name
#   storage_container_name    = azurerm_storage_container.tcscontainer.name
#   type                      = "Block"
# }