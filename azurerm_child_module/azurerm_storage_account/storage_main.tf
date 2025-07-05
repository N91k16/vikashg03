resource "azurerm_storage_account" "prodstorage" {
    for_each = var.storage101
    name = each.value.storage_account_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type

    }

data "azurerm_storage_account" "blockstoragedata" {
  depends_on = [ azurerm_storage_account.prodstorage ]
  name                = "stgkey"
  resource_group_name = "tcsrg"
}

resource "azurerm_storage_container" "blockcontainer" {
    depends_on = [ azurerm_storage_account.prodstorage ]
    for_each = var.container101
  name                    = each.value.name
  storage_account_id     = data.azurerm_storage_account.blockstoragedata.id
  
  container_access_type   =  each.value.container_access_type
}


resource "azurerm_storage_blob" "blockblob" {
    depends_on = [ azurerm_storage_container.blockcontainer ]
    for_each = var.blob101
  name                      = each.value.name
  storage_account_name      = each.value.storage_account_name
  storage_container_name    = each.value.storage_container_name
  type                      = each.value.type
}
